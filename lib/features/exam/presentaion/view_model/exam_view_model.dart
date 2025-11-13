import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/exam/domain/models/question_model.dart';
import 'package:exam_app_project/features/exam/domain/use_cases/get_questions_usecase.dart';
import 'package:exam_app_project/features/exam/presentaion/view_model/exam_events.dart';
import 'package:exam_app_project/features/exam/presentaion/view_model/exam_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExamViewModel extends Cubit<ExamStates> {
  ExamViewModel(this._getQuestionsUsecase) : super(ExamStates());

  final GetQuestionsUsecase _getQuestionsUsecase;

  void doIntent(ExamEvents event) {
    switch (event) {
      case GetQuestionsEvent():
        getExamQuestions(id: event.id, token: event.token);
      case GetQuestionsScoreEvent():
    }
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
        print('doooooooone');
      case ErrorResponse<List<QuestionModel>>():
        emit(
          state.copyWith(
            newQuestions: BaseState<List<QuestionModel>>(
              isLoading: false,
              errorMessage: res.error.toString(),
            ),
          ),
        );
        print('xxxxxxxxxxxxxxxxxxxx');
    }
  }
}
