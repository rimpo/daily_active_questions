enum QuestionStatus { Active, InActive, Deleted }

class Question {
  static int _globalID = 0;
  static String prefix = "Did I do my best to ";
  static String postfix = "?.";

  int id;
  String question;
  DateTime _creation;
  QuestionStatus _status;

  QuestionStatus get status => _status;

  Question(String goal) {
    id = ++Question._globalID;
    question = Question.prefix + goal + Question.postfix;
    _creation = DateTime.now();
    _status = QuestionStatus.Active;
  }

  setActive() {
    _status = QuestionStatus.Active;
  }

  setDelete() {
    _status = QuestionStatus.Deleted;
  }

  setInActive() {
    _status = QuestionStatus.InActive;
  }

  bool IsActive() {
    return _status == QuestionStatus.Active;
  }
}
