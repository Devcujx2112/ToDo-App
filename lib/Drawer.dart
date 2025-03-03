import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
        children: [
          Text(
            'data',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
          )
        ],
      )
    );
  }
}
