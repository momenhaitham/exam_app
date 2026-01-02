class SavedQuestionModel {
  String? question;
  String qustionId;
  List<String?>? answers;
  String? wrongAnswer;
  String? trueAnswer;
  SavedQuestionModel({this.question,this.answers,this.trueAnswer,this.wrongAnswer,required this.qustionId}){
  }
}