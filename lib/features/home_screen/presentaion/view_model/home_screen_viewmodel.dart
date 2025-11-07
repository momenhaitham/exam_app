import 'package:exam_app_project/features/home_screen/presentaion/view_model/home_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewmodel extends Cubit<HomeScreenStates>{
  HomeScreenViewmodel():super(HomeScreenSwitchTabsState());
  int SelectedTab = 0;
}