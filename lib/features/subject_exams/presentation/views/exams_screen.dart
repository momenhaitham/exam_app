import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_routes.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/subject_exams/presentation/view_model/subject_exams_events.dart';
import 'package:exam_app_project/features/subject_exams/presentation/view_model/subject_exams_states.dart';
import 'package:exam_app_project/features/subject_exams/presentation/view_model/subject_exams_view_model.dart';
import 'package:exam_app_project/reuseable_widgets/custome_exam_container.dart';
import 'package:exam_app_project/reuseable_widgets/show_dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamsScreen extends StatelessWidget {
  final SubjectExamsViewModel viewModel = getIt<SubjectExamsViewModel>();

  ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel
        ..DoIntent(GetSubjectExamsEvent(), "670039c3728c92b7fdf43506"),
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
    return BlocConsumer<SubjectExamsViewModel, SubjectExamsStates>(
      listener: (context, state) {
        if (state.subjectExamsState?.isLoading == true) {
          ShowDialogUtils.ShowLoading(context);
        } else if (state.subjectExamsState?.errorMessage != null) {
          ShowDialogUtils.HideLoading(context);
          ShowDialogUtils.ShowMessage(
            context,
            Title: state.subjectExamsState!.errorMessage!,
          );
        } else {
          ShowDialogUtils.HideLoading(context);
        }
      },
      builder: (context, state) {
        final data = state.subjectExamsState?.data;

        if (data == null || data.exams.isEmpty) {
          return const Center(child: Text("No exams found."));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.exams.length,
                  itemBuilder: (context, index) {
                    final exam = data.exams[index];
                    return PrimaryExamContainer(
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
      },
    );
  }
}
