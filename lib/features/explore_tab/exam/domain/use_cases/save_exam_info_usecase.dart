import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/repo/exam_repo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class SaveExamInfoUsecase {
  SaveExamInfoUsecase({required this.examRepo});
  final ExamRepoContract examRepo;

  void call ({
    required ExamInfoModel examInfoModel,
  }) {
    examRepo.saveExamInfo(examInfoModel: examInfoModel);
  }
}