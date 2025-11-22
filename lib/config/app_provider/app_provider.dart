
import 'package:exam_app_project/core/app_keys.dart';
import 'package:exam_app_project/core/app_routes.dart';
import 'package:exam_app_project/features/home_screen/presentaion/views/home_screen.dart';
import 'package:exam_app_project/features/login/presentaion/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppProvider extends ChangeNotifier{
  String? token;
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  AppProvider(){
    readTokin();
  }

  Future<void> readTokin()async{
    token = await storage.read(key: AppKeys.tokinKey);
    print("${token} >>>>>>>>>>>>>>>>>>>>>>> read");
  }


  Future<void> writeTokin(String Token)async{
    await storage.write(key: AppKeys.tokinKey, value: Token);
    print("${Token} >>>>>>>>>>>>>>>>>>>>>>> write");
  }


  
}