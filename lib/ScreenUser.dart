import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:todo_app/Drawer.dart';

class MainScreenUser extends StatefulWidget {
  const MainScreenUser({super.key});

  @override
  State<MainScreenUser> createState() => _MainScreenUserState();
}

class _MainScreenUserState extends State<MainScreenUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustom(),
        appBar: AppBar(
      centerTitle: true,
      title: Text('Todo App'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.add,
            color: Colors.green,
            size: 37,
          ),
        )
      ],
    ));
  }
}
