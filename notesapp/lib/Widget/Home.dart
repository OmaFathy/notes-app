import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notesapp/localdatabase/local.dart';
import 'package:notesapp/localdatabase/usermodel.dart';
import 'package:notesapp/screens/editnote.dart';
import 'package:notesapp/screens/edituser.dart';
import 'package:notesapp/screens/notes_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();

class Home_page extends StatefulWidget {
  @override
  State<Home_page> createState() => _Home_page();
}

class _Home_page extends State<Home_page> {
  GlobalKey<FormState> _globalKey = GlobalKey();
  DateTime date = DateTime.now();

  SqlDb sqlDb = SqlDb();
  bool isload=true;
  List notes=[];
  Future readData() async {
    List<Map> response = await sqlDb.readData("SELECT *FROM notes");
    notes.addAll(response);
    isload=false;
    if(this.mounted){
      setState(() {
        
      });
    }
    return response;
  }

  late final int index_favorite;
  Color Icon_Color = Colors.grey;
  @override
  void initState() {
    // TODO: implement initState
    readData();
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 226, 224),
        body: Container(
          child: ListView(
            children: [
        
                    ListView.builder(
                          itemCount: notes.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return Container(
                                width: 200,
                                height: 120,
                                margin: EdgeInsets.all(5),
                                //padding: EdgeInsets.all(5),
                                
                                
                                  child: Card(
                                      color: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          "${notes[i]['note_title']}",
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            // fontFamily: "note"
                                          ),
                                        ),
                                        subtitle: Text(
                                          "${notes[i]['note_content']}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 30.0,

                                            // fontFamily: "note"
                                          ),
                                        ),
                                        trailing: (SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    IconButton(
                                                      onPressed: ()async {

                                                        int response=await sqlDb.deleteData("DELETE FROM notes WHERE id=${notes[i]['id']}");
                                                        if(response>0)
                                                        {
                                                        notes.removeWhere((element) => element['id']==notes[i]['id']);
                                                       setState(() {
                                                         
                                                       });
                                                        }
                                                      },
                                                      icon: Icon(Icons.delete),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                       Navigator.of(context).push(
                                                        MaterialPageRoute(builder: (context)=>editnote(
                                                       note_title:notes[i]['note_title'] ,
                                                       note_content: notes[i]['note_content'] ,
                                                       id: notes[i]['id'],
                                                        ))
                                                       );
                                                      },
                                                      icon: Icon(Icons.edit),
                                                    ),
                                                  ]),
                                            ],
                                          
                                        ),
                                        )
                                      )
                                      ),
                                )
                                );
                          }
                          )
                   
            ],
          ),
        ),
      ),
    );
  }
}
