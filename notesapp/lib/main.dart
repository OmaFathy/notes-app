import 'package:flutter/material.dart';
import 'package:notesapp/Widget/profile.dart';
import 'package:notesapp/screens/addnotes.dart';
import 'package:notesapp/screens/editnote.dart';
import 'package:notesapp/screens/edituser.dart';
import 'package:notesapp/screens/notes_screen.dart';
import 'package:notesapp/screens/splash_screen.dart';
import 'package:notesapp/screens/user_login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
    // home: SplashScreen(),
     initialRoute: "/splashscreen" ,
      routes: {
      "/splashscreen": (context) => SplashScreen(),
        "/userlogin" : (context) => user_login(),
        "/notes_screen" : (context) =>notes_screen(),
        "/profileuser":((context) => Profile_page()),
        "/edituser":((context) => edituser()),
         "/addnotes":((context) => addnotes()),
           "/editnotes":((context) => editnote()),
        
      },
     // home:notes_screen(),
    );
  }
}
