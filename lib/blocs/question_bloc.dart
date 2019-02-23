import 'package:daily_active_questions/models/question.dart';
import 'package:bloc/bloc.dart';


class QuestionEvent {

}

class QuestionBloc  extends Bloc<QuestionEvent, Question> {
  @override
  // TODO: implement initialState
  Question get initialState => null;

  @override
  Stream<Question> mapEventToState(Question currentState, QuestionEvent event) {
    // TODO: implement mapEventToState
    return null;
  }
}