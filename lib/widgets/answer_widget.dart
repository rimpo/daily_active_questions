import 'package:flutter/material.dart';

import 'package:daily_active_questions/models/question.dart';
import 'package:daily_active_questions/blocs/question_bloc.dart';

import 'package:daily_active_questions/models/answer.dart';

import 'package:daily_active_questions/providers/bloc_provider.dart';

class AnswerWidget extends StatefulWidget {
  AnswerWidget(this._answer, this._dt);
  final Answer _answer;
  final DateTime _dt;

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState(_answer, _dt);
}

class _AnswerWidgetState extends State<AnswerWidget> {
  _AnswerWidgetState(this._answer, this._dt);

  final Answer _answer;
  final DateTime _dt;
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final QuestionBloc questionBloc = BlocProvider.of<QuestionBloc>(context);

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: Text(_answer.question.question),
            //subtitle: Text("${_question.id}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Slider(
                    activeColor: Colors.indigoAccent,
                    min: 0.0,
                    max: 10.0,
                    onChanged: (newRating) {
                      _answer.rating = newRating;
                      questionBloc.sendAnswers.add(_answer);
                      setState(() => _sliderValue = newRating);
                    },
                    value: _sliderValue,
                  )),
              Container(
                width: 40.0,
                alignment: Alignment.center,
                child: Text('${_sliderValue.toInt()}',
                    style: Theme.of(context).textTheme.display1),
              ),
            ],
          )
        ]);
  }
}
