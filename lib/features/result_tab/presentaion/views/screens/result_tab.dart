import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/result_tab/presentaion/view_model/result_tab_events.dart';
import 'package:exam_app_project/features/result_tab/presentaion/view_model/result_tab_states.dart';
import 'package:exam_app_project/features/result_tab/presentaion/view_model/result_tab_view_model.dart';
import 'package:exam_app_project/reuseable_widgets/custome_exam_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultTab extends StatelessWidget{
  final ResultTabViewModel viewModel = getIt<ResultTabViewModel>();
  
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => viewModel
        ..doIntent(GetSavedExamsEvent()),
      child: Scaffold(
        body: _buildBodyWidget(),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height:40.h),
          Align(alignment: AlignmentGeometry.centerLeft,
          child:Text(
          AppStrings.result,
          style: AppStyles.normal20Black.copyWith(fontWeight: FontWeight.w500),
           ), 
          ),
          SizedBox(height:20.h),
          BlocBuilder<ResultTabViewModel, ResultTabStates>(
            builder: (context, state) {
              if (state.resultTabState?.isLoading == true) {
                return Expanded(child: Center(child: CircularProgressIndicator()));
              }else if (state.resultTabState?.errorMessage != null && state.resultTabState?.isLoading==false){
                return Expanded(child: Center(
                  child: Text(state.resultTabState!.errorMessage!,style:AppStyles.normal20Black ,),
                ));
              }else if(state.resultTabState?.data != null && state.resultTabState?.isLoading==false){
                if(state.resultTabState?.data?.isEmpty == null||state.resultTabState!.data!.isEmpty){
                  return const Center(child: Text(AppStrings.noExamFound));
                }else
                 return Expanded(
                  child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.resultTabState!.data!.length,
                        itemBuilder: (context, index) {
                          final exam = state.resultTabState!.data![index];
                          return PrimaryExamContainer(
                            id: exam.id??"",
                            examsTitle: exam.title,
                            duration: exam.duration.toString(),
                            examName: exam.title,
                            numberOfQuestions:
                                 exam.numberOfQuestions.toString(),
                            correctedQuestions: exam.correctedQuestions,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
              }else{
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

}