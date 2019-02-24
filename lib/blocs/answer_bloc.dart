import 'dart:async';

import 'package:daily_active_questions/providers/bloc_provider.dart';

import 'package:daily_active_questions/models/answer.dart';
import 'package:daily_active_questions/respository/answer_repo.dart';
import 'package:daily_active_questions/events/answer_event.dart';

import 'package:rxdart/rxdart.dart';





class AnswerBloc  extends BlocBase {

  final AnswerRepository _answerRepo = AnswerRepository();

  final ReplaySubject<List<Answer>> _replay = ReplaySubject<List<Answer>>();

  //incoming current answer
  StreamController<Answer> _answerSelection = StreamController<Answer>();
  List<Answer> _currentAnswers = List<Answer>();
  DateTime _currentAnswerDate;

  //incoming actions
  StreamController<AnswerEvent> answerActions =StreamController<AnswerEvent>();
  Stream<List<Answer>> get answers => _replay.stream; 

  AnswerBloc(){
    _replay.add(_answerRepo.answers);
    answerActions.stream.listen(_answerEventHandler);
  }

  void _answerEventHandler(AnswerEvent answerEvent){
      switch (answerEvent.type) {
        case AnswerEventType.RatingChanged:
          
          break;
        case AnswerEventType.Submit:
        break;
        default:
      }
  }

  @override
  void dispose() {
    
  }
  
}