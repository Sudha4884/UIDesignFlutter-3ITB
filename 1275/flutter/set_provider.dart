import 'package:flutter/material.dart';
import 'package:provider/provider.dart';//'flutter pub add provider'in terminal

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('State management with Provider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountDisplay(),
              SizedBox(height:20 ,),
              IncrementButton(),
            ],
          ),
          ),
      ),
    );
  }
}

class Counter with ChangeNotifier{
  int count = 0;

  void increment(){
    count++;
    notifyListeners();
  }
}

class CountDisplay extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final count = Provider.of<Counter>(context).count;
    return Text(
      'Count: $count',
      style: TextStyle(fontSize: 24),
    );
  }
}

class IncrementButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Provider.of<Counter>(context,listen: false).increment();
      }, 
      child: Text('Increment'),
      );
  }
}
