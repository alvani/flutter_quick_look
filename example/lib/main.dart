import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quick_look/flutter_quick_look.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool writing = false;
  String path;

  @override
  void initState() {
    super.initState();    
  }  

  writeCSV() async {
    if (defaultTargetPlatform  == TargetPlatform.iOS) {      
      const data = [
        ['O', 'X', 'X'],
        ['X', 'O', 'X'],
        ['X', 'X', 'O']
      ];

      String csv = const ListToCsvConverter().convert(data);
      String directory = (await getApplicationDocumentsDirectory()).path;
      var file = await File('$directory/test.csv').writeAsString(csv);
      await FlutterQuickLook2.openURL(file.path);
      setState(() {
        // path = file.path;
        writing = false;  
      });
    } else {
      setState(() {
        writing = false;  
      });  
    }     
  }

  @override
  Widget build(BuildContext context) { 
    print(path);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child:            
            (path == null) ? Text('Please press Open CSV button') : FlutterQuickLook(path),          
        ),
        persistentFooterButtons: <Widget>[
          writing ? Text('Writing') : RaisedButton(            
            onPressed: () {
              setState(() {
                writing = true;  
              });              
              writeCSV();
            },
            child: Text('Open CSV', style: TextStyle(color: Colors.black),),
          )
        ],
      ),
    );
  }
}

