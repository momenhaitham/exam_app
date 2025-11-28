import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/domain/model/get_exam_model.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/domain/use_cases/get_exam_use_case.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/presention/view_model/get_exam_events.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/presention/view_model/get_exam_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExamViewModel extends Cubit<GetExamStates> {
  GetExamUseCase getExamUseCase;
  GetExamViewModel(this.getExamUseCase) : super(GetExamStates());

  void doIntent(GetExamEvents events ,String examId,String? token) => getExam(examId,token);

  void getExam (String examId,String? token) async{
    emit(state.copyWith(getExamStateParam: BaseState<GetExamModel>(isLoading: true )));
    BaseResponse<GetExamModel> getExamResponse = await getExamUseCase.startExam(examId,token);
    switch(getExamResponse){
      case SuccessResponse<GetExamModel>():
        emit(state.copyWith(getExamStateParam: BaseState<GetExamModel>(data: getExamResponse.data,isLoading: false )));
      case ErrorResponse<GetExamModel>():
        String errorMassege = getExamResponse.error.toString();
        emit(state.copyWith(getExamStateParam: BaseState<GetExamModel>(errorMessage: errorMassege ,isLoading: false )));
    }
  }
}