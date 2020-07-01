
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:read_easy/commons.dart';
import 'package:read_easy/transformed.dart';

class Paste extends StatefulWidget {
  @override
  _PasteState createState() => _PasteState();
}

class _PasteState extends State<Paste> {
  Defaults d = Defaults();
  // InputDataInField i = InputDataInField();

  // Data data = Data();
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

   void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // String recievedText;
  String data;
  var slidervalue = 20.0;
  // var initialValue = 20.0;
  bool mode = false;
  String backG = 'assets\\backs\\minis\\mini_fback1.png';

  String backGSel = 'assets\\backs\\fback1.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Paste content here')
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: (){
         Navigator.push(context,
         MaterialPageRoute(builder: (context) => Transformed(data, slidervalue, mode, backGSel)) );
      }, label: Text('Read'), icon: Icon(Icons.send),),
      // color: Colors.white,
      body: 
                ListView(
        children: [Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value){
                    data = value;
                    print(data);
                },
                onSubmitted: (value){
                  print('Go');
          },
                controller: _controller,
                maxLines: 15,
                decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Paste here',
                            ),
              ),
            ),
            
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Adjust output font size below: ', style: d.helpPasteTextStyle,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SliderTheme(
            data: SliderThemeData(
              activeTrackColor: Colors.black,
              inactiveTrackColor: Colors.black38,
              // valueIndicatorShape: SliderComponentShape.noOverlay,
              thumbColor: Colors.black,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
              valueIndicatorTextStyle: TextStyle(
                color: Colors.white
              )
            ),
                      child: Slider(min: 16, value: slidervalue, max: 40,
            divisions: 24,
            label: slidervalue.toString(),
            // thumbColor: Colors.green,
            onChanged: (value)
              {setState(() {
                // initialValue = value;
                slidervalue = value;
                print(slidervalue);
              }
              );
              }, 
              ),
          ),
        ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Page Background', style: d.helpPasteTextStyle,),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(10, 0, 0, 2),
//             child: Container(
//               child: DropdownButton<String>(
//                 elevation: 2,
//                 value: backG,
//   items: <String>[d.name1, d.name2, d.name3, d.name4, d.name5, d.name6, d.name7].map((String value) {
//     return DropdownMenuItem<String>(value: value,child: new Image.asset(value),);
    
//   }).toList(),
//   onChanged: (value) {
//     setState(() {
//       backG = value;
//       if (backG == d.name1){backGSel = d.back1;}
//     else if (backG == d.name2){backGSel = d.back2;}
//     else if (backG == d.name3){backGSel = d.back3;}
//     else if (backG == d.name4){backGSel = d.back4;}
//     else if (backG == d.name5){backGSel = d.back5;}
//     else if (backG == d.name6){backGSel = d.back6;}
//     else if (backG == d.name7){backGSel = d.back7;}
//     });
    
//     // else if (backG == d.name2){backGSel = d.name2;}
//   },
// )
//             ),
//           )
//         ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Read in dark mode', style: d.helpPasteTextStyle,),
            Switch(
              activeTrackColor: Colors.black,
              inactiveTrackColor: Colors.black38,
              activeColor: Colors.black,
              value: mode, onChanged: (status){
              setState(() {
                mode = status;
                print(mode);
              });
            }),
          ],
        )
        
        ],
              
      )

      
    );
  }
}
