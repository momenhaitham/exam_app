import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_endpoints.dart';
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
  SubjectsScreenViewmodel Viewmodel = getIt<SubjectsScreenViewmodel>();
  Widget build(BuildContext context) {
    Viewmodel.DoIntent(GetallSubjectsEvent(),tokin: AppEndpoints.tokin);
    return BlocProvider<SubjectsScreenViewmodel>(
      create:(context) => Viewmodel,
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
            Container(
              height: 48.h,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.grey,),
                  hintText: AppStrings.search,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(80))
                ),
              )
            ),
            const SizedBox(height: 16,),
            BlocConsumer< SubjectsScreenViewmodel,SubjectsScreenStates>(
            builder: (context, state) {
              if(state.SubjectsScreenState?.isLoading == true){
                return Expanded(child: CircularProgressIndicator());
              }else if (state.SubjectsScreenState?.isLoading == false && state.SubjectsScreenState?.data!=null){
                return 
                Expanded(child:
                 ListView.separated(
                 itemCount: 10,
                 itemBuilder: (context, index) {
                  return SubjectCard(SubName: state.SubjectsScreenState?.data?.SubjectsModelsList?[index].name!,
                  SubPhoto:state.SubjectsScreenState!.data!.SubjectsModelsList![index].icon!,);
                  },
                    separatorBuilder: (context, index) {
                    return SizedBox(height: 10,) ;
                  },
               ));
              }else if (state.SubjectsScreenState?.isLoading == false && state.SubjectsScreenState?.errorMessage!=null){
                return Text(state.SubjectsScreenState!.errorMessage!);
              }else{
                return Container();
              }
            },
            listener: (context, state) {
              
            },
            ),
            
          ],
        ),
      ),
    );
  }
}