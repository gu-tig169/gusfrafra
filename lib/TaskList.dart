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
      children: widget.list.map((task) => _taskItem(context, task)).toList(),
    );
  }

  Widget _taskItem(context, task) {
    return Container(
      child: CheckboxListTile(
        title: Text(task.header, style: _lineThrough(task)),
        controlAffinity: ListTileControlAffinity.leading,
        value: task.finished,
        onChanged: (change) {
          setState(() {
            task.finished = change;
            Provider.of<MyState>(context, listen: false).isFinished(task);
          });
        },
        activeColor: Theme.of(context).colorScheme.secondary,
        checkColor: Colors.black87,
        secondary: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeTask(task);
          },
        ),
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
    );
  }

  _lineThrough(task) {
    if (task.finished == true) {
      return TextStyle(
          decoration: TextDecoration.lineThrough, color: Colors.grey);
    }
  }
}
