import 'dart:async';

import 'package:daily_active_questions/models/question.dart';
import 'package:daily_active_questions/providers/bloc_provider.dart';
import 'package:daily_active_questions/respository/question_repo.dart';

import 'package:rxdart/rxdart.dart';




class QuestionBloc  extends BlocBase {

  final QuestionRepository _questionRepo = QuestionRepository();

  final ReplaySubject<List<Question>> _replay = ReplaySubject<List<Question>>();

  Stream<List<Question>> get activeQuestions => _replay.stream; 

  QuestionBloc(){
    _replay.add(_questionRepo.activeQuestions);
  }

  @override
  void dispose() {
    
  }
  
}