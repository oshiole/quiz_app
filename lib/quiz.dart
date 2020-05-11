import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// List of variables
var finalScore = 0;
var questionNumber = 0;

// Creating a quiz object
var quizApp = new FlutterQuiz();

class FlutterQuiz {
  // List of all questions
  var questions = [
    "What language is used for writing Flutter",
    "What widget is used to display images in a Flutter app",
    "What is the name of the widget that has state information",
    "Who owned the Flutter framework",
    "What is the equivalent name in Flutter for activity in Android"
  ];

  // List of answers
  var answersToQuestions = [
    "Dart",
    "ImageWidget",
    "Stateful Widget",
    "Google",
    "Scene"
  ];

  // List of options
  var questionOptions = [
    ["Kotlin", "JavaScript", "Nim", "Dart"],
    ["TextView", "ImageWidget", "Image", "Widget"],
    ["State", "Stateless Widget", "Stateful Widget", "Container"],
    ["Facebook", "Apple", "Google", "Microsoft"],
    ["Scene", "Screen", "App", "New State"]
  ];
}

class NewQuiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewQuizState();
  }

}

class NewQuizState extends State<NewQuiz> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,

      child: Scaffold(

        body: Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(25.0),),
              Container(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Question ${questionNumber + 1} of "
                        "${quizApp.questions.length}"),

                    Text('Score $finalScore')
                  ],
                ),
              ),

              // Questions
              Padding(padding: EdgeInsets.all(20.0),),
              Card(
                elevation: 25.0,
                child: Text(quizApp.questions[questionNumber],
                style: Theme.of(context).textTheme.display2),
              ),

              // Answers
              Padding(padding: EdgeInsets.all(20.0),),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: (){
                      if(quizApp.questionOptions[questionNumber][0] == quizApp.answersToQuestions[questionNumber]){
                        debugPrint('Correct');
                        finalScore++;
                      }else{
                        debugPrint('Wrong');
                      }
                    },
                    child: new Text(quizApp.questionOptions[questionNumber][0],
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                      ),),
                  ),

                  //button 2
                  MaterialButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: (){
                      if(quizApp.questionOptions[questionNumber][1] == quizApp.answersToQuestions[questionNumber]){
                        debugPrint('Correct');
                        finalScore++;
                      }else{
                        debugPrint("Wrong");
                      }
                    },
                    child: new Text(quizApp.questionOptions[questionNumber][1],
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                      ),),
                  ),

                  //button 3
                  MaterialButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: (){
                      if(quizApp.questionOptions[questionNumber][2] == quizApp.answersToQuestions[questionNumber]){
                        debugPrint('Correct');
                        finalScore++;
                      }else{
                        debugPrint('Wrong');
                      }
                    },
                    child: new Text(quizApp.questionOptions[questionNumber][2],
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                      ),),
                  ),

                  //button 4
                  MaterialButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: (){
                      if(quizApp.questionOptions[questionNumber][3] == quizApp.answersToQuestions[questionNumber]){
                        debugPrint('Correct');
                        finalScore++;
                      }else{
                        debugPrint('Wrong');
                      }
                    },
                    child: Text(quizApp.questionOptions[questionNumber][3],
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                      ),),
                  ),

                ],
              ),

              Padding(padding: EdgeInsets.all(20.0)),

              Container(
                  alignment: Alignment.bottomCenter,
                  child:  MaterialButton(
                      color: Colors.deepOrangeAccent,
                      onPressed: updateQuestion,
                      child: new Text("Next",
                        style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                        ),)
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
  void updateQuestion(){
    setState(() {
      if(questionNumber == quizApp.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
}


class Summary extends StatelessWidget{
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        body: Container(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text("Final Score: $score",
                style: new TextStyle(
                    fontSize: 35.0
                ),),

            ],
          ),
        ),


      ),
    );
  }


}

