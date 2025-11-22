import 'package:exam_app_project/core/app_routes.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/models/subjects_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectCard extends StatelessWidget{
  SubjectsModel subjectsModel;
  SubjectCard({required this.subjectsModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.subjectExamsScreenRoute,arguments:subjectsModel.id);
      },
      child: Container(
        height: 80.h,
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
            child: Row(
              children: [
                Container(
                  width: 60.h,
                  height: 80.h,
                  child: Image.network(this.subjectsModel.icon!,
                  width: double.infinity,
                  height: 60.h,
                  )
                ),
                SizedBox(width: 25.w,),
                Text(this.subjectsModel.name!,style: AppStyles.ragular16Black,)
              ],
            ),
          ),
        ),
      
      ),
    );
  }
}