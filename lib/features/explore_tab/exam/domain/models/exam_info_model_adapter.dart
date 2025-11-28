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
      correctedQuestions: reader.read(),
      id: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, ExamInfoModel obj) {
    writer.writeString(obj.title);
    writer.writeInt(obj.duration);
    writer.writeInt(obj.numberOfQuestions);
    writer.write(obj.correctedQuestions);
    writer.writeString(obj.id??"");
  }
}