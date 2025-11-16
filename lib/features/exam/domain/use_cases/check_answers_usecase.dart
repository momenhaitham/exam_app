// features/exam/domain/use_cases/check_answers_usecase.dart
import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/exam/domain/models/answer_item_model.dart';
import 'package:exam_app_project/features/exam/domain/models/check_answers_result_model.dart';
import 'package:exam_app_project/features/exam/domain/repo/exam_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckAnswersUsecase {
  CheckAnswersUsecase({required this.examRepo});
  final ExamRepoContract examRepo;

  Future<BaseResponse<CheckAnswersResultModel>> call({
    required List<AnswerItemModel> answers,
    required String token,
  }) {
    return examRepo.checkAnswers(answers: answers, token: token);
  }
}
