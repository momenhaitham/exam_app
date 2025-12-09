class SavedQuestionModel {
  String? question;
  List<String?> answers;
  String? wrongAnswer;
  String? trueAnswer;
  SavedQuestionModel({this.question,required this.answers,this.trueAnswer,this.wrongAnswer}){
  }
}