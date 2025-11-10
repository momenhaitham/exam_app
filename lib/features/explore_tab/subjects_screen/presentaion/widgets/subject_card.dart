import 'package:exam_app_project/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectCard extends StatelessWidget{
  String? SubName;
  String? SubPhoto;
  SubjectCard({required this.SubName,required this.SubPhoto});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Image.network("https://exam.elevateegy.com/uploads/categories/67ee864e5554b32891275c49-flutter.png",
                width: double.infinity,
                height: 60.h,
                )
              ),
              SizedBox(width: 25.w,),
              Text("ass",style: AppStyles.ragular16Black,)
            ],
          ),
        ),
      ),

    );
  }
}