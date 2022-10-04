import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notesapp/localdatabase/local.dart';
import 'package:notesapp/screens/notes_screen.dart';

import '../Widget/Home.dart';

class addnotes extends StatefulWidget {
  const addnotes({super.key});

  @override
  State<addnotes> createState() => _addnotesState();
}

class _addnotesState extends State<addnotes> {
  String? title;
  String? description;
  TextEditingController title_note = TextEditingController();
  TextEditingController content_note = TextEditingController();
  SqlDb sqlDb = SqlDb();

  /* Future<List<Map>> readData() async{
        List<Map>response=await sqlDb.readData("SELECT *FROM notes");
      return response;
      }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 115, 8, 134),
          title: Text("Note App"),
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  child: TextFormField(
                    controller: title_note,
                    maxLines: 5,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                    onChanged: (Title) => setState(() => this.title = Title),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: content_note,
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type something...',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                    onChanged: (description) =>
                        setState(() => this.description = description),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 250, 0, 0),
                    child: Divider(
                      color: Colors.black87,
                    )),
                Container(
                  width: 300,
                  child: MaterialButton(
                    onPressed: () async {
                      int response = await sqlDb.insertData('''

                               INSERT INTO 'notes'('note_title','note_content')
                               VALUES('${title_note.text}','${content_note.text}')
                               ''');
                      if(response>0)
                      {
                        Navigator.of(context).pushAndRemoveUntil(
                           MaterialPageRoute(
                        builder:(context)=>notes_screen()), 
                        (route) => false);
                        
                      }
                    },
                    color: Color.fromARGB(255, 115, 8, 134),
                    textColor: Colors.white,
                    child: Text(
                      "Add Note",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                )
              ]),
            )));
  }
}
