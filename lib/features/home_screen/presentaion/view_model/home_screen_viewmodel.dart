import 'package:exam_app_project/features/explore_tab/subjects_screen/presentaion/views/subjects_screen.dart';
import 'package:exam_app_project/features/home_screen/presentaion/view_model/home_screen_states.dart';
import 'package:exam_app_project/features/result_tab/presentaion/views/screens/result_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreenViewmodel extends Cubit<HomeScreenStates>{
  HomeScreenViewmodel():super(HomeScreenSwitchTabsState());
  int selectedTab = 0;
  Widget? currentSelectedTab = SubjectsScreen();
  

  void switchTabs(int selected){

    if(selected==selectedTab){
      return;
    }else if (selected == 0){
      selectedTab=selected;
      currentSelectedTab = SubjectsScreen();
    }else if (selected == 1){
      selectedTab=selected;
      currentSelectedTab = ResultTab();
    }
    emit(HomeScreenSwitchTabsState());

  }
}