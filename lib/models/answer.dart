import 'package:daily_active_questions/models/question.dart';

class Answer {
  DateTime date;
  Question question;
  double rating;

  Answer(this.date, this.question, this.rating);
}
