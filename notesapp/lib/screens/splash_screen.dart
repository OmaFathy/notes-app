import 'dart:async';

import 'package:flutter/material.dart';

import 'user_login_screen.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => user_login()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 250, 0, 0),
              child: Image.asset("assets/images/note.png",
             height: 250,
           //width: 600,
              ),
              
            ),
          ),
           Text("Notes App",
         style: TextStyle
         (
          fontSize: 30.0,
          fontFamily: "myfont",
         ),
         ),
        ],
      ),
    );
  }
}