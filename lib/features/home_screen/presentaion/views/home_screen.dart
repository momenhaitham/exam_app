import 'package:exam_app_project/core/app_assets.dart';
import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/home_screen/presentaion/view_model/home_screen_states.dart';
import 'package:exam_app_project/features/home_screen/presentaion/view_model/home_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  HomeScreenViewmodel homeScreenViewmodel = HomeScreenViewmodel();
  

  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenViewmodel>(
      create: (context) => homeScreenViewmodel,
      child: BlocBuilder<HomeScreenViewmodel,HomeScreenStates>(
        builder:(context, state) {
          return Scaffold(
          bottomNavigationBar: BottomAppBar(
            
            padding: EdgeInsets.zero,
            elevation: 0,
            child: BottomNavigationBar(
              selectedItemColor: AppColors.blue,
              selectedLabelStyle: AppStyles.Medium16Blue ,
              unselectedLabelStyle: AppStyles.Medium16Gray,
              items: [
              BottomNavigationBarItem(activeIcon:Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(66),
                    color: AppColors.lightBlue),
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
                child: Image.asset(AppAssets.exploreSelected)
                ),
              icon:Image.asset(AppAssets.exploreUnselected),label:AppStrings.explore),
              BottomNavigationBarItem(activeIcon:Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(66),
                    color: AppColors.lightBlue),
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
                child: Image.asset(AppAssets.resultSelected)),
              icon:Image.asset(AppAssets.resultUnselected),label:AppStrings.result),
              BottomNavigationBarItem(activeIcon:Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(66),
                    color: AppColors.lightBlue),
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
                child: Image.asset(AppAssets.profileSelected)),
              icon:Image.asset(AppAssets.profileUnselected),label:AppStrings.profile),
            ],
              elevation: 0,
              currentIndex:homeScreenViewmodel.SelectedTab ,
              onTap: (selected){
                homeScreenViewmodel.SelectedTab=selected;
                setState(() {});
              },
            ),
          ),
          body: homeScreenViewmodel.Tabs[homeScreenViewmodel.SelectedTab],
        );
        } ,
      ),
    );
  }
}