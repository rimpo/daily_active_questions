
import 'package:flutter/material.dart';


import 'package:daily_active_questions/providers/bloc_provider.dart';
import 'package:daily_active_questions/blocs/question_bloc.dart';

import 'package:daily_active_questions/models/question.dart';

import 'package:daily_active_questions/widgets/answer_widget.dart';

import 'dart:async';


class AnswerPage extends StatefulWidget {
  @override
  _AnswerPageState createState() => _AnswerPageState();
}


class _AnswerPageState extends State<AnswerPage> {

  DateTime _selectedDate;
  String _value = '';

  AnswerWidgetState(){
    _selectedDate = DateTime.now();
    _value = '${_selectedDate.year}/${_selectedDate.month}/${_selectedDate.day}';
  }


  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2025)
    );
    if(picked != null) setState(() {
    _selectedDate = picked;
    _value = '${picked.year}/${picked.month}/${picked.day}';
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final QuestionBloc questionBloc = BlocProvider.of<QuestionBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[ 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(_value),
          RaisedButton(onPressed: _selectDate, child: Text('Select Date'),)
        ],
      ),  
        Flexible(child:StreamBuilder<List<Question>>(
        stream: questionBloc.activeQuestions,
        initialData: null,
        builder:(context, snapshot) { 
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
               return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(),
        child: AnswerWidget(snapshot.data[index]),
      ),
    );
            }
          );
        }
      )),
      
      RaisedButton(
        onPressed: (){},
        child:Text("Submit")
      )
      ]);
  }
  
}