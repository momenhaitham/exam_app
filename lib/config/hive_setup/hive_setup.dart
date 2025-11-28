import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model_adapter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


  Future<void> initHive()async{
    final documentDiractory =await getApplicationDocumentsDirectory();
    Hive.init(documentDiractory.path);
    Hive.registerAdapter(ExamInfoModelAdapter());
  }
