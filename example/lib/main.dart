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
      await FlutterQuickLook.openURL(file.path);
      setState(() {        
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Please press Open CSV button'),            
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

