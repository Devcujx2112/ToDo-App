import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/AddToDo.dart';
import 'package:todo_app/Drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreenUser extends StatefulWidget {
  const MainScreenUser({super.key});

  @override
  State<MainScreenUser> createState() => _MainScreenUserState();
}

class _MainScreenUserState extends State<MainScreenUser> {
  String text = 'Hello World';
  List<String> listAction = [];

  @override
  void initState() {
    super.initState();
    LoadDataLocal();
  }

  void ChangeText({required String todoText}) {
    if (listAction.contains(todoText)) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Duplicate'),
              content: Text('Data da dc tao'),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                )
              ],
            );
          });
      return;
    }
    setState(() {
      listAction.insert(0, todoText);
    });
    UpdateDataLocal();

    Navigator.pop(context);
  }

  void UpdateDataLocal() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('items', listAction);
    LoadDataLocal();
  }

  void LoadDataLocal() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    listAction = (preferences.getStringList('items') ?? []).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Column(
          children: [
            Container(
              color: Colors.blueGrey[900],
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  "ToDo App",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                launchUrl(Uri.parse("https://www.google.com"));
              },
              leading: Icon(Icons.person),
              title: Text(
                'About Me',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        )),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Todo App'),
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                height: 200,
                                child: AddToDo(
                                  changeText: ChangeText,
                                ),
                              ));
                        });
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.green,
                    size: 37,
                  ),
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: listAction.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.all(20),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    listAction.removeAt(index);
                                  });
                                  UpdateDataLocal();
                                  Navigator.pop(context);
                                },
                                child: Text('Remove')),
                          );
                        });
                  },
                  title: Text(listAction[index]),
                  trailing: Icon(Icons.add),
                  leading: Icon(Icons.arrow_back),
                );
              }),
        ));
  }
}
