import 'package:flutter/material.dart';
import 'create_page.dart';
import 'question.dart';
import 'quiz_page.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizzler'),
          backgroundColor: Colors.blue[700],
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Question> myQuizQuestions;

  bool isMyQuizDisabled() {
    if (myQuizQuestions == null) {
      return true;
    } else {
      if (myQuizQuestions.length == 0) {
        return true;
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: FlatButton(
              padding: EdgeInsets.all(25.0),
              textColor: Colors.white,
              color: Colors.blue[700],
              child: Text(
                'Trivia Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //Navigate user to trivia quiz.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage(null)),
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: FlatButton(
              disabledColor: Colors.grey,
              padding: EdgeInsets.all(25.0),
              textColor: Colors.white,
              color: Colors.blue[700],
              child: Text(
                'My Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: isMyQuizDisabled()
                  ? null
                  : () {
                      //Navigate user to trivia quiz.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizPage(myQuizQuestions)),
                      );
                    },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: FlatButton(
              padding: EdgeInsets.all(25.0),
              textColor: Colors.white,
              color: Colors.blue[700],
              child: Text(
                'Create Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () async {
                //Navigate user to trivia quiz.
                List<Question> createdQuiz = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePage()),
                );
                setState(() {
                  myQuizQuestions = createdQuiz;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
