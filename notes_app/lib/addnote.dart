import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
// import 'package:intl/intl.dart';


class AddNote extends StatefulWidget {
  const AddNote({Key ? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController _note = TextEditingController();
  returnMonth(int month){
    Map months = {1:'January', 2:'February', 3:'March',
    4:'April', 5:'May', 6:'June', 7:'July', 8:'August',
      9:'September', 10:'October', 11:'November', 12:'December'};
    return months[month];
  }
  returnDay(int day){
    Map days = {1:'Monday',2:'Tuesday',3:'Wednesday',4:'Thursday',5:'Friday',6:'Saturday',7:'Sunday'};
    return days[day];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      appBar: AppBar(backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Add Note'),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _note,
              decoration: InputDecoration(
                labelText: 'Add a Note',
                labelStyle: TextStyle(
                  fontFamily: 'Head',
                  color: Colors.black,
                  fontSize: 24
                ),
                hintText: 'Write Something',

              ),
              maxLines: 10,

            ),
          ),
          MaterialButton(onPressed: (){
            String dateToday = (DateTime.now().year.toString()+', '+returnMonth(DateTime.now().month)+' '+DateTime.now().day.toString());
            String timeNow = (DateTime.now().hour.toString()+':'+DateTime.now().minute.toString());
            // print(dateToday);
            // print(returnDay(DateTime.now().weekday).toString());
            data.add({'day':DateTime.now().weekday.toString(),'time':timeNow,'date': dateToday,'content':_note.text});
            Navigator.pop(context);
          },child: Text('Submit', style: TextStyle(color: Colors.white, fontFamily: 'Head'),),color: Colors.black,)
        ],
      ),
    );
  }
}
