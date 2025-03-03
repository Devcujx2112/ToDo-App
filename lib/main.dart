import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/ScreenUser.dart';
void main() {
  runApp(ToDo_App());
}

class ToDo_App extends StatefulWidget {
  const ToDo_App({super.key});

  @override
  State<ToDo_App> createState() => _ToDo_AppState();
}

class _ToDo_AppState extends State<ToDo_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: MainScreenUser(),
    );
  }
}
