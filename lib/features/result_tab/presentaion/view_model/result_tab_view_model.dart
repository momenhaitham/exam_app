import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model.dart';
import 'package:exam_app_project/features/result_tab/data/repo/result_tab_repo_contract.dart';
import 'package:exam_app_project/features/result_tab/presentaion/view_model/result_tab_events.dart';
import 'package:exam_app_project/features/result_tab/presentaion/view_model/result_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ResultTabViewModel extends Cubit<ResultTabStates>{
    ResultTabViewModel(this.resultTabRepoContract):super(ResultTabStates());
    ResultTabRepoContract resultTabRepoContract;

    void doIntent(ResultTabEvents event){
        switch(event){  
          case GetSavedExamsEvent():
            _GetSavedExams();
        }
    }


    void _GetSavedExams()async{
        emit(state.copyWith(resultTabStateParam: BaseState<List<ExamInfoModel>>(isLoading: true)));
        BaseResponse<List<ExamInfoModel>> savedExams = await resultTabRepoContract.getSavedExams();
        switch(savedExams){
            
          case SuccessResponse<List<ExamInfoModel>>():
            emit(state.copyWith(resultTabStateParam: BaseState<List<ExamInfoModel>>(isLoading: false,data: savedExams.data)));
          case ErrorResponse<List<ExamInfoModel>>():
            emit(state.copyWith(resultTabStateParam: BaseState<List<ExamInfoModel>>(isLoading: false,errorMessage: savedExams.error.toString())));
        }
    }
}