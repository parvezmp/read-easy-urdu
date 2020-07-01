import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:read_easy/commons.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
// import 'package:read_easy/paste.dart';

class Transformed extends StatefulWidget {
  final String dataR;
  final double size;
  final bool mode;
  final String backG;
  Transformed(this.dataR, this.size, this.mode, this.backG);
  @override
  TransformedState createState() => TransformedState(this.dataR, this.size, this.mode, this.backG);
}

class TransformedState extends State<Transformed> {

  Defaults d = Defaults();
  String dataR;
  double size;
  bool mode;
  String backG;
  TransformedState(this.dataR, this.size, this.mode, this.backG);
 
  GlobalKey globalKey = GlobalKey();

  Future<void> captureImg() async{
    RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    print(pngBytes.runtimeType);
    File imgFile =new File('$directory/screenshot.png');
    imgFile.writeAsBytes(pngBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 50.0,
        child: RaisedButton.icon(onPressed: (){
          captureImg();
        }, 
        splashColor: Colors.white38,
        color: Colors.black,
        icon: Icon(Icons.share, color: Colors.white,), label: Text('Share', style: d.shareButtonStyleStyle,))),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 10.0,
        title: Text('Content in Nastaleeq Font', style: TextStyle(fontSize: 18.0),),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: (){Navigator.pop(context);}, label: Text('Back'), icon: Icon(Icons.arrow_back_ios)),
      body: Container(
        color: mode?Colors.black87:Colors.white,
        child: Column(
          children: [
            Flexible(
              child: ListView(
                children: [
                  RepaintBoundary(
                     key: globalKey,
                     child: Container(
                        child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 20, 0),
                        child: SelectableText(dataR==null?d.nothing:dataR, style: mode?TextStyle(fontFamily: 'NotoNastaleeq', fontSize: size, color: Colors.white,):TextStyle(fontFamily: 'NotoNastaleeq', fontSize: size, color: Colors.black,), textDirection: TextDirection.rtl
                        // toolbarOptions: ToolbarOptions()
                        ),
                      )),
                  )
                ],
              ),
            )
              // child: Text('Content in Nastaleeq Urdu font', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            ],
        ),
      ),
    );
  }
}
