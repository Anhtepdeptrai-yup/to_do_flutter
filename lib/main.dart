import 'package:flutter/material.dart';
import 'package:to_do_flutter/pages/home_page.dart';
import 'package:to_do_flutter/pages/todo_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {

      }
    );
  }

}