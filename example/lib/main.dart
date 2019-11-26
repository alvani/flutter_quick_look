import 'package:flutter/material.dart';
import 'package:flutter_quick_look/flutter_quick_look.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();    
  }

  final Map<String, dynamic> anu = {
    'hello': 'worldstoragepath',
  };

  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child:            
            FlutterQuickLook(''),          
        ),
      ),
    );
  }
}

