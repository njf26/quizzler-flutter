import 'package:flutter/material.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  List<Icon> questionIndicator = [];
  List<Question> myQuizQuestions = [];
  final _formKey = GlobalKey<FormState>();
  bool answer = true; //current answer provided
  String question; //current question provided

  void addQuestion() {
    if (questionIndicator.length <= 12) {
      setState(() {
        myQuizQuestions.add(Question(question, answer));
        questionIndicator.add(Icon(
          Icons.check_box,
          color: Colors.blue[700],
        ));
        answer = true;
        question = '';
      });
    } else {
      setState(() {
        answer = true;
        question = '';
      });
      Alert(
              context: context,
              title: "MAX",
              desc: "Your quiz can have a maximum of 13 questions")
          .show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzler'),
        backgroundColor: Colors.blue[700],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your question',
                            focusColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a question';
                            }
                            return null;
                          },
                          onSaved: (String question) {
                            this.question = question;
                          },
                        ),
                        RadioListTile<bool>(
                          title: const Text('True'),
                          value: true,
                          groupValue: answer,
                          onChanged: (bool trueFalse) {
                            setState(() {
                              //set question as true or false
                              answer = trueFalse;
                            });
                          },
                        ),
                        RadioListTile<bool>(
                          title: const Text('False'),
                          value: false,
                          groupValue: answer,
                          onChanged: (bool trueFalse) {
                            setState(() {
                              //set question as true or false
                              answer = trueFalse;
                            });
                          },
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  // Validate will return true if the form is valid, else false
                                  if (_formKey.currentState.validate()) {
                                    // Process data, clear form
                                    _formKey.currentState.save();
                                    addQuestion();
                                    _formKey.currentState?.reset();
                                  }
                                },
                                child: Text('Submit Question'),
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.pop(context, myQuizQuestions);
                                },
                                child: Text('Submit Quiz'),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: questionIndicator,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
