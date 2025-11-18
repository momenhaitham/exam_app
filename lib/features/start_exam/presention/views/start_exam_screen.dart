import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_assets.dart';
import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/features/start_exam/presention/view_model/get_exam_events.dart';
import 'package:exam_app_project/features/start_exam/presention/view_model/get_exam_states.dart';
import 'package:exam_app_project/features/start_exam/presention/view_model/get_exam_view_model.dart';
import 'package:exam_app_project/reuseable_widgets/show_dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartExamScreen extends StatelessWidget {
  final GetExamViewModel viewModel = getIt<GetExamViewModel>();
  StartExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..doIntent(GetExamEvent() , "" ),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBodyWidget(context),
      ),
    );
  }
  
  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back, color: Colors.black),
      ),
    );
  }
  
  Widget? _buildBodyWidget(BuildContext context) {
    return BlocConsumer<GetExamViewModel, GetExamStates>(
      listener: (context, state){
        if(state.getExamState?.isLoading == true){
          ShowDialogUtils.ShowLoading(context);
        }else if(state.getExamState?.errorMessage != null){
          ShowDialogUtils.HideLoading(context);
          ShowDialogUtils.ShowMessage(context, Title: state.getExamState!.errorMessage!);
        }else{
          ShowDialogUtils.HideLoading(context);
        }
      },
      builder: (context, state) {
        final data = state.getExamState?.data;
        if (data == null) {
          return const Center(child: Text("No exams found."));
        }

        return Padding(
        padding: EdgeInsets.all(12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppAssets.examImage
                ),
                SizedBox(width: 10.w,),
                Text(data.exam.title ,style: TextStyle(color: Colors.black,fontSize: 20.sp , fontWeight: FontWeight.w600), ), // modify the title
                Spacer(),
                Text(data.exam.duration.toString(),style: TextStyle(color: Colors.blue,fontSize: 13.sp , fontWeight: FontWeight.w400), ), // modify the duration
              
            ]),
            SizedBox(height: 6.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.exam.title , style: TextStyle(color: Colors.black,fontSize: 18.sp , fontWeight: FontWeight.w500), ), // modify the level
                SizedBox(width: 5.w,),
                VerticalDivider(
                  width: 1.w,
                  thickness: 1.h,
                  color: Colors.lightBlueAccent,
                ),
                SizedBox(width: 5.w,),
                Text (data.exam.questionCount.toString() ,style: TextStyle(color: Colors.grey,fontSize: 16.sp , fontWeight: FontWeight.w400), ), // modify the language
            ],),
            SizedBox(height: 10.h,),
            Divider(
      
            ),
            SizedBox(height: 30.h,),
            Text(AppStrings.instructions , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.w500),),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildInstructionWidget(AppStrings.instructionContent),
                  _buildInstructionWidget(AppStrings.instructionContent),
                  _buildInstructionWidget(AppStrings.instructionContent),
                  _buildInstructionWidget(AppStrings.instructionContent),
                ],
              ),
            ),
            SizedBox(height: 30.h,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.blue),
                    ),
                     child: Text(AppStrings.startExam ,style: TextStyle(color: Colors.white , fontSize: 16.sp , fontWeight: FontWeight.w500),),
                     ),
                ),
              ],
            )
          ],
        ),
      );
      },
    );
  }
  
  _buildInstructionWidget(String instructionContent) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle ,size: 10, ),
          SizedBox(width: 10.w,),
          Text(instructionContent , style: TextStyle(color: Colors.black , fontSize: 16.sp , fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }
}