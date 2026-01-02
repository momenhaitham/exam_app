import 'package:exam_app_project/features/explore_tab/exam/domain/models/saved_question_model.dart';
import 'package:hive/hive.dart';
import 'exam_info_model.dart';

class ExamInfoModelAdapter extends TypeAdapter<ExamInfoModel> {
  @override
  final int typeId = 1; 

  @override
  ExamInfoModel read(BinaryReader reader) {
    return ExamInfoModel(
      title: reader.readString(),
      duration: reader.readInt(),
      numberOfQuestions: reader.readInt(),
      numberOfCorrectedQuestions: reader.read(),
      id: reader.readString(),
      savedQuestions: reader.readList().cast<SavedQuestionModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ExamInfoModel obj) {
    writer.writeString(obj.title);
    writer.writeInt(obj.duration);
    writer.writeInt(obj.numberOfQuestions);
    writer.write(obj.numberOfCorrectedQuestions);
    writer.writeString(obj.id??"");
    writer.writeList(obj.savedQuestions??[]);
  }
}