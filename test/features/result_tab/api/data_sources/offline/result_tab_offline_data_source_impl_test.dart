import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model.dart';
import 'package:exam_app_project/features/result_tab/api/data_sources/offline/result_tab_offline_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'result_tab_offline_data_source_impl_test.mocks.dart';

@GenerateMocks([ResultTabOfflineDataSourceImpl])
void main() {
  late ResultTabOfflineDataSourceImpl resultTabOfflineDataSourceImpl;
  setUpAll(() {
    resultTabOfflineDataSourceImpl = MockResultTabOfflineDataSourceImpl();
    provideDummy<BaseResponse<List<ExamInfoModel>>>(
      SuccessResponse<List<ExamInfoModel>>(data: [])
    );
  },);


  group("Test Get Saved Exams function test casess", () {
    test("Test Success Case With Get Saved Exams With non Empty List of Models", ()async {
      List<ExamInfoModel> dummyExamsList = [
        ExamInfoModel(title: "1", duration: 1, numberOfQuestions: 1, id: "1"),
        ExamInfoModel(title: "2", duration: 2, numberOfQuestions: 2, id: "2"),
        ExamInfoModel(title: "3", duration: 3, numberOfQuestions: 3, id: "3"),
      ];

      when(resultTabOfflineDataSourceImpl.getSavedExams()).thenAnswer((_)async{
        return await SuccessResponse<List<ExamInfoModel>>(data: dummyExamsList);
      });

      var result =await resultTabOfflineDataSourceImpl.getSavedExams();
      expect(result,isA<SuccessResponse<List<ExamInfoModel>>>());
      expect((result as SuccessResponse<List<ExamInfoModel>>).data, isNotEmpty);
      verify(resultTabOfflineDataSourceImpl.getSavedExams()).called(1);
    },);

    test("Test Success Case With Get Saved Exams With Empty List", ()async{
      when(resultTabOfflineDataSourceImpl.getSavedExams()).thenAnswer((_)async{
        return await SuccessResponse<List<ExamInfoModel>>(data: []);
      });

      var result = await resultTabOfflineDataSourceImpl.getSavedExams();
      expect(result,isA<SuccessResponse<List<ExamInfoModel>>>());
      expect((result as SuccessResponse<List<ExamInfoModel>>).data,isEmpty);
    });

    test("Test Error Case With Get Saved Exams",() {
      when(resultTabOfflineDataSourceImpl.getSavedExams()).thenAnswer((_)async{
        return ErrorResponse(error:"some thing went wrong");
      });

      var result = resultTabOfflineDataSourceImpl.getSavedExams();
      expect(result,isA<Future<ErrorResponse<List<ExamInfoModel>>>>());
    },);

  },);
}