import "package:flutter/material.dart";

class Tasks {
  String header;
  String description;
  bool finished;

  Tasks({this.header, this.description, this.finished});
}

class MyState extends ChangeNotifier {
  List<Tasks> _list = [];
  String filter;

  List<Tasks> get list => _list;

  void addTask(Tasks task) {
    _list.add(task);
    notifyListeners();
  }

  void removeTask(Tasks task) {
    _list.remove(task);
    notifyListeners();
  }

  void isFinished(Tasks task, change) {
    task.finished = change;
    notifyListeners();
  }
}
