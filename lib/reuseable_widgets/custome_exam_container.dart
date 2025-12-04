import 'package:exam_app_project/core/app_assets.dart';
import 'package:exam_app_project/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryExamContainer extends StatelessWidget {
  String examsTitle;
  String examName;
  String id;
  String numberOfQuestions;
  String duration;
  int? correctedQuestions;
  String? from = 1.toString();
  String? to = 6.toString();
  String? navigateRoute;
  
  PrimaryExamContainer({super.key,this.correctedQuestions,required this.examsTitle ,this.navigateRoute,required this.id ,required this.examName, required this.numberOfQuestions, required this.duration, this.from, this.to});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //todo: Navigate with the exam details screen with the ID>>>>>>>>
        Navigator.of(context).pushNamed(navigateRoute??AppRoutes.startExamScreenRoute,arguments:id);
      },
      child: Column(
        children: [
          SizedBox(height: 20.h,),
          Container(
            margin: EdgeInsets.only(bottom: 15.h),
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.h),
              color: Colors.white70,
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Image.asset(
                      AppAssets.examImage,
                      height: 71.h,
                      width: 60.h,
                    ),
                  ],
                ),
                SizedBox(width: 10.h,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(examName,style: TextStyle(color: Colors.black,fontSize: 16.sp , fontWeight: FontWeight.w500),),
                    SizedBox(height: 5.h,),
                    Text(numberOfQuestions,style: TextStyle(color: Colors.grey,fontSize: 13.sp , fontWeight: FontWeight.w400),),
                    SizedBox(height: 15.h,),
                    Text(correctedQuestions==null?"From: $from    To: $to":"$correctedQuestions corrected answers in $duration",
                    style: correctedQuestions==null? TextStyle(color: Colors.black,fontSize: 16.sp):TextStyle(color: Colors.blue,fontSize: 16.sp)),
                  ],
                ),
                SizedBox(width: 20.h,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$duration Minutes",style: TextStyle(color: Colors.blue,fontSize: 13.sp , fontWeight: FontWeight.w400),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}