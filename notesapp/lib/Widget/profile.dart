import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notesapp/localdatabase/usermodel.dart';
import 'package:notesapp/screens/edituser.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();

class Profile_page extends StatefulWidget {
  @override
  State<Profile_page> createState() => _Profile_page();
}

class _Profile_page extends State<Profile_page> {
  GlobalKey<FormState> _globalKey = GlobalKey();

  void initState() {
    super.initState();
    getdate();
  }

  usermodel? userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      //  mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Form(
                key: _globalKey,
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/image1.png",
                        height: 200,
                        width: 150,
                      ),
                    ),
                    Text(
                      '${userModel?.name}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${userModel?.email}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${userModel?.phone}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {
                          //   await savePrefs();
                          Navigator.pushNamed(context, "/edituser");
                        },
                        color: Color.fromARGB(255, 115, 8, 134),
                        textColor: Colors.white,
                        child: Text(
                          "EDIT USER DATA",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 300,
                      child: MaterialButton(
                        onPressed: () {
                          //   await savePrefs();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Delete Data"),
                              content: Text("Are You sure?"),
                              actions: [
                                TextButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    delete();
                                    Navigator.pushNamed(context, "/userlogin");
                                  },
                                ),
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                  Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        color: Color.fromARGB(255, 251, 0, 0),
                        textColor: Colors.white,
                        child: Text(
                          "Delete ACCOUNT",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    ));
  }

  void getdate() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      var value = sharedPreferences.getString('usermodel');
      userModel =
          value == null ? usermodel() : usermodel.fromJson(json.decode(value));
      //print(userModel.toJson());
    });
  }

  delete() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('text');
    userModel?.name = " ";
    userModel?.email = " ";
    userModel?.phone = " ";
    setState(() {});
  }
}
