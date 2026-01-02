import 'package:exam_app_project/features/explore_tab/exam/domain/models/saved_question_model.dart';
import 'package:hive/hive.dart';

class SavedQuestionModelAdapter extends TypeAdapter<SavedQuestionModel> {
  @override
  final int typeId = 2; 

  @override
  SavedQuestionModel read(BinaryReader reader) {
    return SavedQuestionModel(
      
      question: reader.readString(),
      trueAnswer: reader.readString(),
      wrongAnswer: reader.readString(),
      answers: reader.readList().cast<String>(),
      qustionId: reader.readString()
    );
  }

  @override
  void write(BinaryWriter writer, SavedQuestionModel obj) {
    writer.writeString(obj.question??"");
    writer.writeString(obj.trueAnswer??"");
    writer.writeString(obj.wrongAnswer??"");
    writer.writeList(obj.answers??[]);
    writer.writeString(obj.qustionId);
  }
}