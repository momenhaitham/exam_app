import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/saved_question_model.dart';
import 'package:exam_app_project/features/result_tab/presentaion/widgets/saved_question_card.dart';
import 'package:flutter/material.dart';

class SavedExamScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var savedExam = ModalRoute.of(context)?.settings.arguments as ExamInfoModel ;

    return Scaffold(
      body: Expanded(child: ListView.builder(
        itemCount: savedExam.savedQuestions!.length,
        itemBuilder:(context, index) {
          
          return SavedQuestionCard(savedQuestionModel: savedExam.savedQuestions![index]);
        } ,
         )),
    );
  }
}