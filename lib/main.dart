import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Daily Caters'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Container(
          child: Image(
            image: AssetImage('images/LIZZAA.jpg'),
          ),
        ),

      ),
    );
  }
}
