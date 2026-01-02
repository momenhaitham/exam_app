
import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/saved_question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedQuestionCard extends StatelessWidget{
  SavedQuestionCard({required this.savedQuestionModel});

  SavedQuestionModel savedQuestionModel;
  

  int? answerKeyToIndex(String? answerKey){
    Map<String,dynamic> answers= {
    "A1":0,
    "A2":1,
    "A3":2,
    "A4":3,
  };
  return answers[answerKey];
  }
  
  @override
  Widget build(BuildContext context) {
  int? correctAnswerIndex = answerKeyToIndex(savedQuestionModel.trueAnswer!);
  int? inCorrectAnswerIndex = answerKeyToIndex(savedQuestionModel.wrongAnswer);
  
  return Container(
        
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
          color: Colors.black.withOpacity(0.08), 
          blurRadius: 10, 
          spreadRadius: 1, 
          offset: Offset(0, 4),
        ),
        ]
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: Colors.white
          ) ,
          padding: EdgeInsets.all(12),
          
          child: Padding(
            
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Text(savedQuestionModel.question!,style: AppStyles.normal20Black,),
                FormBuilderCheckboxGroup<String?>(
                  name: savedQuestionModel.question??"",

                  initialValue:answerKeyToIndex(savedQuestionModel.trueAnswer??savedQuestionModel.trueAnswer)!=null?
                  [savedQuestionModel.answers?[answerKeyToIndex(savedQuestionModel.trueAnswer??savedQuestionModel.trueAnswer)!]]:[] ,
                  enabled: false,
                  checkColor: Colors.blue,
                  
                  decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                options: savedQuestionModel.answers!.map((option) => FormBuilderFieldOption( 
                    value: option,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color:_decideColor(falseAnswer:answerKeyToIndex(savedQuestionModel.wrongAnswer??savedQuestionModel.wrongAnswer)!=null?savedQuestionModel.answers![answerKeyToIndex(savedQuestionModel.wrongAnswer??savedQuestionModel.wrongAnswer)!]:null,
                        passedAnswer: option ,
                        trueAnswer:answerKeyToIndex(savedQuestionModel.trueAnswer??savedQuestionModel.trueAnswer)!=null?savedQuestionModel.answers![answerKeyToIndex(savedQuestionModel.trueAnswer??savedQuestionModel.trueAnswer)!]:null
                        )
                        ,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(option??"",style: AppStyles.ragular16Black,),
                    ),
                  ),).toList(),
                controlAffinity: ControlAffinity.leading,
)             
              ],
            ),
          ),
        ),
      
      );
  }
  
}

Color _decideColor({String? trueAnswer,String? falseAnswer,String? passedAnswer}){
if(falseAnswer !=null){
  if(passedAnswer==falseAnswer){
    return Colors.red;
  }else if (passedAnswer==trueAnswer){
    return Colors.green;
  }else{
    return Colors.grey;
  }
}else{
   if (passedAnswer==trueAnswer){
    return Colors.green;
  }else{
    return Colors.grey;
  }
}

}