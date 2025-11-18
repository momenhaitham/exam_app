import 'package:exam_app_project/core/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryExamContainer extends StatelessWidget {
  String examsTitle;
  String examName;
  String numberOfQuestions;
  String duration;
  String? from = 1.toString();
  String? to = 6.toString();
  PrimaryExamContainer({super.key,required this.examsTitle , required this.examName, required this.numberOfQuestions, required this.duration, this.from, this.to});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          Text(examsTitle,style: TextStyle(color: Colors.black,fontSize: 16.sp , fontWeight: FontWeight.w500),),
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
                    Text("From: $from    To: $to",style: TextStyle(color: Colors.black,fontSize: 16.sp),),
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