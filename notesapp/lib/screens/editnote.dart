import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notesapp/screens/notes_screen.dart';

import '../localdatabase/local.dart';

class editnote extends StatefulWidget {
  final note_title;
  final note_content;
  final id;

  editnote({Key? key, this.note_title, this.note_content, this.id})
      : super(key: key);
  @override
  State<editnote> createState() => _editnoteState();
}

class _editnoteState extends State<editnote> {
  SqlDb sqlDb = SqlDb();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController note_title = TextEditingController();
  TextEditingController note_content = TextEditingController();
  @override
  void initState() {
    note_title.text = widget.note_title;
    note_content.text = widget.note_content;
    // TODO: implement initState
    super.initState();
  }

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
              child: Form(
                key: formstate,
                child: Column(children: [
                  Container(
                    child: TextFormField(
                      controller: note_title,
                      maxLines: 5,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      /* decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                      ),*/
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      controller: note_content,
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      /* decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type something...',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                      ),*/
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
                        int response = await sqlDb.updateData('''
              
                                 UPDATE notes SET
                                 note_title="${note_title.text}",
                                 note_content="${note_content.text}"
                              WHERE id=${widget.id}
                                 ''');
                        if (response > 0) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => notes_screen()),
                              (route) => false);
                        }
                      },
                      color: Color.fromARGB(255, 115, 8, 134),
                      textColor: Colors.white,
                      child: Text(
                        "Update Note",
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  )
                ]),
              ),
            )));
  }
}
