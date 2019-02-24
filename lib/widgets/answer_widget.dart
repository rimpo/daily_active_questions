
import 'package:flutter/material.dart';

import 'package:daily_active_questions/models/question.dart';

class AnswerWidget extends StatefulWidget{

  AnswerWidget(this._question);

  final Question _question;

  @override
  State<StatefulWidget> createState() => AnswerWidgetState(_question);
}

class AnswerWidgetState extends State<AnswerWidget> {
  AnswerWidgetState(this._question);

  final Question _question;
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: Text(_question.question),
          //subtitle: Text("${_question.id}"),

      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Flexible(
        flex:1, 
        child: Slider(
          activeColor: Colors.indigoAccent,
          min: 0.0,
          max: 10.0,
          onChanged: (newRating) {
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
      ]
    );
  }
  

}