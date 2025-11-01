import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialogUtils {


  static void ShowLoading(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(title: Text("Loading",style: AppStyles.normal20Black,),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: CircularProgressIndicator(color: AppColors.blue,),
      ),
        backgroundColor: Colors.white
      );
    },barrierDismissible: false);
  }

  static void HideLoading(BuildContext context){
    Navigator.pop(context);
  }

  static void ShowMessage(
      BuildContext context,
      { String? Title, String? Content, String? PosActionName, Function? PosAction, String? NigActionName, Function? NigAction,})
  {
    List<Widget> Actions=[];
    if(PosActionName!=null){
      Actions.add(TextButton(onPressed: (){
        PosAction==null?Navigator.pop(context):PosAction.call();
        }, child:Text(PosActionName,style: AppStyles.normal20Black,)));
    }
    if(NigActionName!=null){
      Actions.add(TextButton(onPressed: (){
        NigAction==null?Navigator.pop(context):NigAction.call();
      }, child:Text(NigActionName,style: AppStyles.normal20Black,)));
    }
    showDialog(context: context, builder: (context){
      return AlertDialog(title: Text(Title??"",style: AppStyles.normal20Black,),
        content: Text(Content??'',style: AppStyles.normal20Black,),
        actions: Actions,
        backgroundColor: Colors.white,
      );
    });

  }




}