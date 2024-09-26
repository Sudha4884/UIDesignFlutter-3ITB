import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Image with Text and Container')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2), 
                  borderRadius: BorderRadius.circular(10), 
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), 
                  child: Image.asset(
                    'assets/butterfly.jpg',  
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10), 
              Text(
                'Butterfly Image',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
