import 'dart:async';

import 'package:daily_active_questions/providers/bloc_provider.dart';

import 'package:daily_active_questions/models/question.dart';
import 'package:daily_active_questions/models/answer.dart';

import 'package:daily_active_questions/events/answer_event.dart';

import 'package:daily_active_questions/respository/question_repo.dart';
//import 'package:daily_active_questions/respository/answer_repo.dart';

import 'package:rxdart/rxdart.dart';

class QuestionBloc extends BlocBase {
  //--- Questions ---

  final QuestionRepository _questionRepo = QuestionRepository();

  final ReplaySubject<List<Question>> _questions =
      ReplaySubject<List<Question>>();

  Stream<List<Question>> get activeQuestions => _questions.stream;

  //--- Answers ---

  //incoming answer
  StreamController<Answer> _answerSelection = StreamController<Answer>();
  List<Answer> _currentAnswers = List<Answer>();
  DateTime _currentAnswerDate;

  StreamSink<Answer> get sendAnswers => _answerSelection.sink;

  //incoming actions
  StreamController<AnswerEvent> _answerActions =
      StreamController<AnswerEvent>();
  StreamSink<AnswerEvent> get sendSubmit => _answerActions.sink;

  //incoming date
  StreamController<DateTime> _answerDate = StreamController<DateTime>();
  StreamSink<DateTime> get sendDate => _answerDate.sink;

  QuestionBloc() {
    _questions.add(_questionRepo.activeQuestions);
    _answerSelection.stream.listen(_answerSelectionHandler);
    _answerActions.stream.listen(_answerSubmitHandler);
    _answerDate.stream.listen(_answerDateHandler);
  }

  void _answerSelectionHandler(Answer data) {}

  void _answerSubmitHandler(AnswerEvent e) {}

  void _answerDateHandler(DateTime dt) {
    print(dt);
  }

  @override
  void dispose() {}
}
