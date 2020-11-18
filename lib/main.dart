import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskList(),
    );
  }
}

class TaskList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 - To Do App"),
        actions: [
          PopupMenuButton(
            onSelected: (selectedFilter) {
              print(selectedFilter);
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(child: Text("Alla"), value: "1"),
              PopupMenuItem(child: Text("Ej Utförda"), value: "2"),
              PopupMenuItem(child: Text("Utförda"), value: "3"),
            ],
          ),
        ],
      ),
      body: _taskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          );
        },
        tooltip: "Lägg till uppgift",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _taskList() {
    return ListView(
      children: [
        _item("Uppgift 1", "Gör först det här", false),
        _item("Uppgift 2", "Gör det här efteråt", false),
        _item("Uppgift 3", "Gör det här sist", true),
        _item("Uppgift 4", "Gör bara detta om det finns tid över", false),
      ],
    );
  }

  Widget _item(uppgift, beskrivning, bool) {
    return CheckboxListTile(
      title: Text(uppgift),
      subtitle: Text(beskrivning),
      controlAffinity: ListTileControlAffinity.leading,
      value: bool,
      onChanged: (value) {},
      secondary: Icon(Icons.delete),
    );
  }
}

class AddTask extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lägg till uppgift")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _addLabel("Uppgift"),
            _addInputField("Skriv din uppgift"),
            _addLabel("Beskrivning"),
            _addInputField("Skriv din beskrivning"),
            Container(height: 15),
            _buttonSave(),
          ],
        ),
      ),
    );
  }

  Widget _addLabel(text) {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 25),
      child: Text(text, style: TextStyle(fontSize: 20)),
    );
  }

  Widget _addInputField(text) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: Colors.blue, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: Colors.blue, width: 1),
          ),
        ),
      ),
    );
  }

  Widget _buttonSave() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: () {},
          child: Text("Lägg till", style: TextStyle(fontSize: 18)),
          color: Colors.blue,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
