import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:Text('Hello World App'),
          backgroundColor:Colors.blueAccent,
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
          Text(
            'Hello, Anamitra!',
            style:TextStyle(fontSize:36),
          ),
          SizedBox(height:20),
          Image.asset(
           'assets/img.jpg',
            width: 300,
            height: 200,
)
        ],
      ),
      ),
    );
  }
} 

  
