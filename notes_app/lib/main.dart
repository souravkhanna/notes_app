import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/addnote.dart';
void main(){
  runApp(MaterialApp(
        initialRoute: '/',
    routes: {
      '/':(context)=>Notes(),
      '/addNote':(context)=>AddNote()
    },
  ));
}


class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

List data= [];


class _NotesState extends State<Notes> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void initState(){
    super.initState();
    data = [{'day':'Monday','time':'7:30','date':'5-7-2021','content':'World seems bitter because I am on diet'},
      {'day':'Tuesday','time':'3:30','date':'7-7-2021','content':'Who is there when no one is there'}];
  }
deleteDialog(BuildContext context, int index){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('want to delete'),
        actions: [IconButton(onPressed: (){
          setState(() {
            data.removeAt(index);
          });
          Navigator.pop(context);
        }, icon: Icon(Icons.delete))],
      );
    });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.redAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'My Notes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Head',
              fontSize: 24
          ),
        ),
        centerTitle: true,

      ),
      body:
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: data.length!=0?GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10
          ),
            children: [
              for(int i=0;i<data.length;i++)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage("https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"),
                      fit:BoxFit.cover
                    ),
                  ),

                  child: InkWell(
                    onTap: (){},
                    onLongPress: (){
                      deleteDialog(context,i);
                    },
                    child: Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      shadowColor: Colors.grey,
                      child: Column(
                        children: [
                          Padding(

                            padding: const EdgeInsets.all(10.0),
                            child: Wrap(
                              children: [
                                Row(
                                  children: [UseText(textdata: data[i]['date']),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.5,),
                                    UseText(textdata: data[i]['time'])],
                                ),
                              ],
                            ),
                          ),
                          // UseText(textdata: data[i]['day'],),
                          UseText(textdata: data[i]['content'])
                        ],
                      ),),
                  ),
                )
            ],


          ):UseText(textdata: 'No Notes'),
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.pushNamed(context, '/addNote'),
        // _addNewNote(context),
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.transparent,
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,



    );
  }
}


class UseText extends StatelessWidget {
  // UseText({Key? key}) : super(key: key);
String? textdata = '';
UseText({required this.textdata});
  @override
  Widget build(BuildContext context) {
    return Text(
      textdata!, style: (
    TextStyle(
      fontFamily: 'Head',
      fontSize: 20
    )
    ),
    );
  }
}

