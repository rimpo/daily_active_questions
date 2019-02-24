import 'package:daily_active_questions/models/question.dart';

class Answer {
  DateTime date;
  Question question;
  int rating;

  Answer(this.date, this.question, this.rating);
}