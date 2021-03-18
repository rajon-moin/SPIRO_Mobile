import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';

class GetQuizjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/python.json"),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text('loading'),
            ),
          );
        } else {
          return Quizpage();
        }
      },
    );
  }
}

class Quizpage extends StatefulWidget {
  // List mydata;
  // Quizpage({Key key, @required this.mydata}) : super(key: key);
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  // List mydata;
  // _QuizpageState(this.mydata);
  Widget choicebutton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          'option 1',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        color: Colors.redAccent,
        minWidth: 200.0,
        height: 40.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/favicon.png',
          fit: BoxFit.contain,
          height: 40,
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(15),
              child: Text(
                "this is a sample question which will be displayed",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  choicebutton(),
                  choicebutton(),
                  choicebutton(),
                  choicebutton(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Text(
                  '30',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
