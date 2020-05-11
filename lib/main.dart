import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz.dart';

void main() {

  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: MyApp(),
    title: "Quiz App",
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Kaboot Game")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Enter a username:',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500
            ) ,
            ),

            Form(
              autovalidate: true,
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.black26.withOpacity(0.6),
                  filled: true,
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Colors.red,
                    )
                  )
                ),
                validator: (user) {
                  if (user.isEmpty) {
                    return 'Enter a username';
                  }
                  return null;
                },
              ),
            ),

            RaisedButton(
              child: Text('Start'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => NewQuiz()
                )
              ),
              elevation: 5.0,
              color: Colors.deepPurpleAccent,
              textColor: Colors.white70,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            ),

            RaisedButton(
              child: Text('Quit'),
              onPressed: () => Navigator.pop(context, 'You Quit'),
              elevation: 5.0,
              color: Colors.deepPurpleAccent,
              textColor: Colors.white70,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            )
          ],
        )
      ),
    );
  }

}
