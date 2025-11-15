import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_endpoints.dart';
import 'package:exam_app_project/core/app_errors.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/presentaion/view_model/subjects_screen_events.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/presentaion/view_model/subjects_screen_states.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/presentaion/view_model/subjects_screen_viewmodel.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/presentaion/widgets/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SubjectsScreen extends StatelessWidget{
  @override
  SubjectsScreenViewmodel viewModel = getIt<SubjectsScreenViewmodel>();
  Widget build(BuildContext context) {
    viewModel.doIntent(GetallSubjectsEvent(),context: context);
    return BlocProvider<SubjectsScreenViewmodel>(
      create:(context) => viewModel,
      child: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 56.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(alignment: Alignment.centerLeft,
            child:Text(AppStrings.survey,style: AppStyles.Medium16Blue.copyWith(fontSize: 20),),
            ),
            const SizedBox(height: 16,),
            BlocBuilder<SubjectsScreenViewmodel,SubjectsScreenStates>(builder: (context, state) {
              return Container(
              height: 48.h,
              child: TextFormField(
                onChanged: (value) {
                  viewModel.doIntent(SearchForSubjectEvent(),searchValue: value,subjectsResponse: state.SubjectsScreenState?.data);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.grey,),
                  hintText: AppStrings.search,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
                  
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(80))
                ),
              )
            );
            },),
            const SizedBox(height: 16,),
            BlocBuilder< SubjectsScreenViewmodel,SubjectsScreenStates>(
            builder: (context, state) {
              if(state.SubjectsScreenState?.isLoading == true){
                return Expanded(child: Center(child: CircularProgressIndicator()));
              }else if (state.SubjectsScreenState?.isLoading == false && state.SubjectsScreenState?.data?.SubjectsModelsList!=null){
                return 
                Expanded(child:
                 ListView.separated(
                 itemCount: viewModel.search.isEmpty||viewModel.search==""?state.SubjectsScreenState!.data!.SubjectsModelsList!.length:viewModel.filteredSubjects!.length,
                 itemBuilder: (context, index) {
                  if(viewModel.search.isEmpty||viewModel.search==""){
                    return SubjectCard(subjectsModel: state.SubjectsScreenState!.data!.SubjectsModelsList![index],);
                  }else{
                    return SubjectCard(subjectsModel: viewModel.filteredSubjects![index]);
                   }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10,) ;
                  },
                  padding: EdgeInsets.zero,
               ));
              }else if (state.SubjectsScreenState?.isLoading == false && state.SubjectsScreenState?.errorMessage!=null){
                return Column(
                  children: [
                    Text(AppErrors.someThingWentWrong),
                    ElevatedButton(onPressed: (){
                      viewModel.doIntent(GetallSubjectsEvent(),context: context);
                    }, child: Text("try again"))
                  ],
                );
              }else{
                return Container();
              }
            },
            ),
          ],
        ),
      ),
    );
  }
}