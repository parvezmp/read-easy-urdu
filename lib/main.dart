import 'package:flutter/material.dart';
import 'package:read_easy/commons.dart';
import 'package:read_easy/paste.dart';
// import 'package:flutter/cupertino.dart'

void main() => runApp(ReadEasy()); 

class ReadEasy extends StatefulWidget {
  @override
  _ReadEasyState createState() => _ReadEasyState();
}

class _ReadEasyState extends State<ReadEasy> {
  Defaults d = Defaults();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Read Easy',
      home: MyHome()
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Defaults d = Defaults();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container( //This is the main container enclosing the app
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(colors: [Colors.cyan, Colors.deepOrange])
          // ),
          child: Column(
            children: [
              Container(
                // constraints: BoxConstraints.loose(size),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                      child: Text('Read Easy', style: d.appTitleStyle,),
                    ),
                    Align(alignment: Alignment.centerRight,
                                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                        child: Text("اردو", style: d.urduApptitle, textDirection: TextDirection.rtl,),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: InkWell(
                      focusColor: Colors.blue,
                      onTap: (){},
                          child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(d.helpText, style: d.helpTextStyle),
                        ),
                    ),
                    )
                ],
              )
            ],
          )
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: (){
         Navigator.push(context,
         MaterialPageRoute(builder: (context) => Paste()) );
        }, label: Text('Start'), icon: Icon(Icons.chrome_reader_mode)),
      );
  }
}