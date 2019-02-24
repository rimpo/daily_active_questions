


import 'package:flutter/material.dart';
import 'package:daily_active_questions/pages/answer_page.dart';
import 'package:daily_active_questions/pages/question_page.dart';
import 'package:daily_active_questions/pages/report_page.dart';

import 'package:daily_active_questions/providers/bloc_provider.dart';
import 'package:daily_active_questions/blocs/question_bloc.dart';


class RootPage extends StatefulWidget {
 RootPage({Key key}) : super(key: key);

 @override
 _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;
 final _widgetOptions = [
   AnswerPage(),
   QuestionPage(),
   ReportPage(),
 ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionBloc>(
        bloc: QuestionBloc(),
      child:MaterialApp(
      title: 'Daily Active Questions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      appBar: AppBar(title: Text('Daily Active Questions')),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.border_color), title: Text("Questions")),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text("Report")),
        ],
        currentIndex: _selectedIndex,
        onTap: _onSelection,
      ),
    ),
  )
  );
}
  void _onSelection(int index) {
      setState((){
        _selectedIndex = index;
      });
  }
}


