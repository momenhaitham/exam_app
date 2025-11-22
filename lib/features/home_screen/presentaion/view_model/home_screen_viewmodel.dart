import 'package:exam_app_project/features/explore_tab/subjects_screen/presentaion/views/subjects_screen.dart';
import 'package:exam_app_project/features/home_screen/presentaion/view_model/home_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreenViewmodel extends Cubit<HomeScreenStates>{
  HomeScreenViewmodel():super(HomeScreenSwitchTabsState());
  int SelectedTab = 0;
  List<Widget> Tabs = [
    SubjectsScreen(),

  ];

}