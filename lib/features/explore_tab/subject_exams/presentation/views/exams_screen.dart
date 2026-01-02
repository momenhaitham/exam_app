import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/config/app_provider/app_provider.dart';
import 'package:exam_app_project/core/app_routes.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/presentation/view_model/subject_exams_events.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/presentation/view_model/subject_exams_states.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/presentation/view_model/subject_exams_view_model.dart';
import 'package:exam_app_project/reuseable_widgets/custome_exam_container.dart';
import 'package:exam_app_project/reuseable_widgets/show_dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ExamsScreen extends StatelessWidget {
  final SubjectExamsViewModel viewModel = getIt<SubjectExamsViewModel>();

  ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String subjectId= ModalRoute.of(context)?.settings.arguments as String;
    var provider = Provider.of<AppProvider>(context);
    provider.readTokin();
    return BlocProvider(
      create: (context) => viewModel
        ..DoIntent(GetAllExamsEvent(),token: provider.token),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBodyWidget(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        AppStrings.languages,
        style: AppStyles.normal20Black.copyWith(fontWeight: FontWeight.w500),
      ),
      leading: InkWell(
        onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.HomeScreenRoute),
        child: const Icon(Icons.arrow_back, color: Colors.black),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return BlocBuilder<SubjectExamsViewModel, SubjectExamsStates>(
      builder: (context, state) {
        if (state.subjectExamsState?.isLoading == true) {
          return Expanded(child: Center(child: CircularProgressIndicator()));
        }else if (state.subjectExamsState?.errorMessage != null && state.subjectExamsState?.isLoading==false){
          return Expanded(child: Center(
            child: Text(state.subjectExamsState!.errorMessage!,style:AppStyles.normal20Black ,),
          ));
        }else if(state.subjectExamsState?.data != null && state.subjectExamsState?.isLoading==false){
          if(state.subjectExamsState?.data?.exams.isEmpty == null||state.subjectExamsState!.data!.exams.isEmpty){
            return const Center(child: Text(AppStrings.noExamsFound));
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
                  itemCount: state.subjectExamsState!.data!.exams.length,
                  itemBuilder: (context, index) {
                    final exam = state.subjectExamsState!.data!.exams[index];
                    return PrimaryExamContainer(
                      id: exam.id??"",
                      examsTitle: exam.subject,
                      duration: exam.duration.toString(),
                      examName: exam.title,
                      numberOfQuestions:
                           exam.numberOfQuestions.toString(),
                      from: "1",
                      to: "6",
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
    );
  }
}

//ModalRoute.of(context)?.settings.arguments
