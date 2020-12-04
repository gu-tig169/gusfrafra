import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "./Model.dart";
import "./TaskList.dart";
import "./AddTask.dart";

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 - To Do App"),
        actions: [
          _taskFilterMenu(context),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            TaskList(_filterTasks(state.list, state.filterBy)),
      ),
      floatingActionButton: _addTaskButton(context),
    );
  }

  Widget _taskFilterMenu(context) {
    return PopupMenuButton(
      onSelected: (isSelected) {
        Provider.of<MyState>(context, listen: false).setFilterBy(isSelected);
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(child: Text("Alla"), value: "Both"),
        PopupMenuItem(child: Text("Ej Utförda"), value: "False"),
        PopupMenuItem(child: Text("Utförda"), value: "True"),
      ],
    );
  }

  Widget _addTaskButton(context) {
    return FloatingActionButton(
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
      backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
      foregroundColor: Colors.black87,
      splashColor: Colors.tealAccent,
    );
  }
}

List<Tasks> _filterTasks(list, filterBy) {
  if (filterBy == "Both") return list;
  if (filterBy == "False")
    return list.where((task) => task.finished == false).toList();
  if (filterBy == "True")
    return list.where((task) => task.finished == true).toList();
  return null;
}
