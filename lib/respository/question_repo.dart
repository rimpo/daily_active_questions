
import 'package:daily_active_questions/models/question.dart';

class QuestionRepository {

  List<Question> _questions = new List<Question>();

  List<Question> get activeQuestions => _questions.where((q) => q.IsActive()).toList();

  QuestionRepository() {
    _questions.add(Question("Read Books"));
    _questions.add(Question("Sleep early wakeup early"));
    _questions.add(Question("learn something new (Technical/Non Technical)"));
  }
}