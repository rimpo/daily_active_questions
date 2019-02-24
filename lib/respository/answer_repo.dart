
import 'package:daily_active_questions/models/answer.dart';


class AnswerRepository {

  List<Answer> _answers = new List<Answer>();

  List<Answer> get answers => _answers;

  AnswerRepository() {
  }
}