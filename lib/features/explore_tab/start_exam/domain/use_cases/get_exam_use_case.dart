import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/domain/model/get_exam_model.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/domain/repo/get_exam_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExamUseCase {
  GetExamRepoContract getExamRepoContract;
  GetExamUseCase({required this.getExamRepoContract});

  Future<BaseResponse<GetExamModel>> startExam(String examId,String? token) async => await getExamRepoContract.startExam(examId,token);
}