import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToDo extends StatefulWidget {

  void Function({required String todoText}) changeText;

  AddToDo({super.key, required this.changeText});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  TextEditingController txt_title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Add ToDo: "),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Nhập tên của bạn',
                  icon: Icon(Icons.verified_user)),
              controller: txt_title,
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            ElevatedButton(
                onPressed: () {
                  widget.changeText(todoText: txt_title.text);
                  txt_title.text = '';
                },
                child: Text('Insert')),
          ],
        ));
  }
}
