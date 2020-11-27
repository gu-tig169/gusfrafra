import "package:flutter/material.dart";

import "./Model.dart";

class AddTask extends StatefulWidget {
  @override
  AddTaskState createState() => AddTaskState();
}

class AddTaskState extends State<AddTask> {
  final controllerHeader = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lägg till uppgift")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _addLabel("Uppgift"),
            _addInputHeader("Skriv din uppgift"),
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

  Widget _addInputHeader(text) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondaryVariant,
                width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary, width: 1),
          ),
        ),
        controller: controllerHeader,
      ),
    );
  }

  Widget _buttonSave() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: () {
            Navigator.pop(
                context, Tasks(header: controllerHeader.text, finished: false));
          },
          child: Text("Lägg till", style: TextStyle(fontSize: 18)),
          color: Theme.of(context).colorScheme.secondaryVariant,
          splashColor: Colors.tealAccent,
          textColor: Colors.black87,
        ),
      ],
    );
  }
}
