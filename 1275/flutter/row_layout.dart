  import 'package:flutter/material.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget{
    const MyApp({super.key});
    @override
    Widget build(BuildContext context){
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Row Layout Example'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.red,
                child: Text('Monika'),
              ),
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                child: Text('Anamitra'),
              ),
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.green,
                child: Text('Harshitha'),
              ),
            ],
          ),
        ),
      );
    }
  }
