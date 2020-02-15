import 'package:flutter/material.dart';
import './home.dart';

void main() => runApp(LLMApp());

class LLMApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LLM App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LLMHomePage(title: 'LLM Church'),
    );
  }
}
