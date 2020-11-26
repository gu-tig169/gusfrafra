import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "./Model.dart";

class TaskList extends StatefulWidget {
  final List<Tasks> list;

  TaskList(this.list);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Widget build(BuildContext context) {
    return ListView(
        children: widget.list.map((task) => _taskItem(context, task)).toList());
  }

  Widget _taskItem(context, task) {
    return CheckboxListTile(
      title: Text(task.header),
      subtitle: Text(task.description),
      controlAffinity: ListTileControlAffinity.leading,
      value: task.finished,
      onChanged: (change) {
        setState(() {
          Provider.of<MyState>(context, listen: false).isFinished(task, change);
        });
      },
      secondary: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeTask(task);
        },
      ),
    );
  }
}
