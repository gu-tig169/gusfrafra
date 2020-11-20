import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "./Model.dart";
import "./TaskList.dart";
import "./AddTask.dart";

void main() {
  var state = MyState();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 - To Do App"),
        actions: [
          _taskFilter(),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => TaskList(state.list),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newTask = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTask(),
            ),
          );
          if (newTask != null) {
            Provider.of<MyState>(context, listen: false).addTask(newTask);
          }
        },
        tooltip: "Lägg till uppgift",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _taskFilter() {
    return PopupMenuButton(
      onSelected: (isSelected) {
        print(isSelected);
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(child: Text("Alla"), value: "Both"),
        PopupMenuItem(child: Text("Ej Utförda"), value: "False"),
        PopupMenuItem(child: Text("Utförda"), value: "True"),
      ],
    );
  }
}
