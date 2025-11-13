import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/exam/domain/models/question_model.dart';
import 'package:exam_app_project/features/exam/domain/repo/exam_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionsUsecase {
  GetQuestionsUsecase({required this.examRepo});
  final ExamRepoContract examRepo;
  Future<BaseResponse<List<QuestionModel>>> call({
    required String examId,
    required String token,
  }) {
    return examRepo.getQuestions(examId: examId, token: token);
  }
}
