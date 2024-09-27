import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaQueryExample(),
    );
  }
}
class MediaQueryExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth < 600 ? 16: 24;
    Color backgroundColor = screenWidth < 600 ? Colors.blue: Colors.green;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title:Text('MediaQuery Example'),
      ),
      body:Center(
        child:Text(
          'Screen width:$screenWidth\n This text is responsive !',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize:fontSize,color:Colors.white),
        ))
      
    );
  }
}
