import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Row Example')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,  // Space around items
          children: <Widget>[
            Container(
              color: Colors.red,  // Set the background color
              width: 100,         // Set width of the box
              height: 100,        // Set height of the box
              alignment: Alignment.center, // Align the text to the center of the box
              child: Text('Item 1', style: TextStyle(color: Colors.white)),
            ),
            Container(
              color: Colors.green,
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: Text('Item 2', style: TextStyle(color: Colors.white)),
            ),
            Container(
              color: Colors.blue,
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: Text('Item 3', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
