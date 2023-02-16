import 'package:flutter/material.dart';
import 'package:gesture_detector/input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beklenen Yaşam',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueGrey,
          primaryColor: Colors.lightGreen),
      home: InputPage(),
    );
  }
}
