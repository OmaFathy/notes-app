import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notesapp/Widget/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localdatabase/usermodel.dart';

class edituser extends StatefulWidget {
  const edituser({super.key});

  @override
  State<edituser> createState() => _edituserState();
}

class _edituserState extends State<edituser> {
  String name = "omar";
  String email = "omohammed20000@gmail.com";
  String phone = "01021389293";
  GlobalKey<FormState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
                child: Form(
              key: _globalKey,
              child: Column(children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(30, 90, 0, 0),
                    child: Text(
                      "Update Your Data",
                      style: TextStyle(fontFamily: "myfont", fontSize: 35.0),
                    ),
                  ),
                ),
                Text(
                  "Now!",
                  style: TextStyle(fontFamily: "myfont", fontSize: 35.0),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(color: Colors.white),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Center(
                    child: TextFormField(
                      onSaved: (value) {
                        name = value!;
                      },
                      decoration: InputDecoration(
                        hintText: "Name..",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 115, 8, 134)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(color: Colors.white),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Center(
                    child: TextFormField(
                      onSaved: (value) {
                        email = value!;
                      },
                      decoration: InputDecoration(
                        hintText: "Email..",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 115, 8, 134)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(color: Colors.white),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Center(
                    child: TextFormField(
                      onSaved: (value) {
                        phone = value!;
                      },
                      decoration: InputDecoration(
                        hintText: "Phone..",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 115, 8, 134)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 300,
                  child: MaterialButton(
                    onPressed: () { 
                    _updatedata();
                      Navigator.pushNamed(context, "/profileuser");
                    }
                    ,color: Color.fromARGB(255, 115, 8, 134),
                    textColor: Colors.white,
                    child: Text(
                      "Update",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                )
              ]),
            ))));
  }

  _updatedata() async {
    _globalKey.currentState!.save();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString('usermodel',
        jsonEncode(usermodel(name: name, email: email, phone: phone).toJson()));

print(sharedPreferences.getString('usermodel'));

    setState(() {});
  }
}
