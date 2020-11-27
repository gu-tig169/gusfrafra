import "package:flutter/material.dart";

import "./Api.dart";

class Tasks {
  String id;
  String header;
  bool finished;

  Tasks({this.id, this.header, this.finished});

  static Map<String, dynamic> toJson(Tasks task) {
    return {
      "title": task.header,
      "done": task.finished,
    };
  }

  static Tasks fromJson(Map<String, dynamic> json) {
    return Tasks(
      id: json["id"],
      header: json["title"],
      finished: json["done"],
    );
  }
}

class MyState extends ChangeNotifier {
  List<Tasks> _list = [];
  String _filterBy = "Both";

  List<Tasks> get list => _list;

  String get filterBy => _filterBy;

  Future getList() async {
    List<Tasks> list = await Api.getTasks();
    _list = list;
    notifyListeners();
  }

  void addTask(Tasks task) async {
    await Api.postTask(task);
    await getList();
  }

  void removeTask(Tasks task) async {
    await Api.deleteTask(task);
    await getList();
  }

  void isFinished(Tasks task) async {
    await Api.putTask(task);
    await getList();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
