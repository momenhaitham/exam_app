
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/models/subjects_model.dart';

class SubjectsResponseModel {
  List<SubjectsModel>? SubjectsModelsList;
  int? currentPage;
  int? numberOfPages;
  int? limit;

  SubjectsResponseModel({this.SubjectsModelsList,this.currentPage,this.limit,this.numberOfPages});
}