import 'dart:developer';

import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/answer_item_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/check_answers_result_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/question_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/use_cases/check_answers_usecase.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/use_cases/get_questions_usecase.dart';
import 'package:exam_app_project/features/explore_tab/exam/presentaion/view_model/exam_events.dart';
import 'package:exam_app_project/features/explore_tab/exam/presentaion/view_model/exam_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExamViewModel extends Cubit<ExamStates> {
  ExamViewModel(this._getQuestionsUsecase, this._checkAnswersUsecase)
    : super(ExamStates());

  final GetQuestionsUsecase _getQuestionsUsecase;
  final CheckAnswersUsecase _checkAnswersUsecase;

  void doIntent(ExamEvents event) {
    switch (event) {
      case GetQuestionsEvent():
        getExamQuestions(id: event.id, token: event.token);
      case SelectAnswerEvent():
        selectAnswer(event.answer);
      case SubmitAnswersEvent():
        submitAnswers(token: event.token, answers: event.answers);
    }
  }

  void selectAnswer(AnswerItemModel answer) {
    final currentAnswers = state.selectedAnswers ?? [];

    currentAnswers.removeWhere((ans) => ans.questionId == answer.questionId);

    currentAnswers.add(answer);

    emit(state.copyWith(newSelectedAnswers: List.from(currentAnswers)));
    log(currentAnswers.toString());
  }

  void getExamQuestions({required String id, required String token}) async {
    emit(
      state.copyWith(
        newQuestions: BaseState<List<QuestionModel>>(isLoading: true),
      ),
    );
    BaseResponse<List<QuestionModel>> res = await _getQuestionsUsecase.call(
      examId: id,
      token: token,
    );
    switch (res) {
      case SuccessResponse<List<QuestionModel>>():
        emit(
          state.copyWith(
            newQuestions: BaseState<List<QuestionModel>>(
              data: res.data,
              isLoading: false,
            ),
          ),
        );
        log('doooooooone');
      case ErrorResponse<List<QuestionModel>>():
        emit(
          state.copyWith(
            newQuestions: BaseState<List<QuestionModel>>(
              isLoading: false,
              errorMessage: res.error.toString(),
            ),
          ),
        );
        log('xxxxxxxxxxxxxxxxxxxx');
    }
  }

  void submitAnswers({
    required String token,
    List<AnswerItemModel>? answers,
  }) async {
    emit(
      state.copyWith(
        newCheckAnswersResult: BaseState<CheckAnswersResultModel>(
          isLoading: true,
        ),
      ),
    );

    final finalAnswers = answers ?? [];

    final BaseResponse<CheckAnswersResultModel> res = await _checkAnswersUsecase
        .call(answers: finalAnswers, token: token);

    if (res is SuccessResponse<CheckAnswersResultModel>) {
      final newState = state.copyWith(
        newCheckAnswersResult: BaseState<CheckAnswersResultModel>(
          isLoading: false,
          data: res.data,
        ),
      );
      emit(newState);
      log(
        'Answers submitted successfully: ${res.data.correctCount} correct, ${res.data.wrongCount} wrong',
      );
    } else if (res is ErrorResponse<CheckAnswersResultModel>) {
      final newState = state.copyWith(
        newCheckAnswersResult: BaseState<CheckAnswersResultModel>(
          isLoading: false,
          errorMessage: res.error.toString(),
        ),
      );
      emit(newState);
      log('Error submitting answers: ${res.error}');
    }
  }
}
