import 'package:flutter/material.dart';
import './ui/OnBoarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'No Faces',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: OnBoarding());
  }
}
