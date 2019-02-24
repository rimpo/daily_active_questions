
import 'package:daily_active_questions/models/answer.dart';

enum AnswerEventType{
  RatingChanged,
  Submit,
}

class AnswerEvent {
  Answer answer;
  AnswerEventType type;

  AnswerEvent(this.answer, this.type);
}

