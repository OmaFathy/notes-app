import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Widget/Home.dart';
import '../Widget/profile.dart';

class notes_screen extends StatefulWidget {
  // const notes_screen({super.key});

  @override
  State<notes_screen> createState() => _notes_screenState();
}

class _notes_screenState extends State<notes_screen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Home_page(),
    Profile_page(),
  
   
   
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 115, 8, 134),
        title: Text("My Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 115, 8, 134),
        onPressed: () {
          Navigator.pushNamed(context, "/addnotes");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
           
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            backgroundColor: null,
            label: 'Profile',
          ),
         
         
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color.fromARGB(255, 115, 8, 134),
      ),
    );
  }
}
