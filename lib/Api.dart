import "dart:convert";
import "package:http/http.dart" as http;

import "./Model.dart";

const API_URL = "https://todoapp-api-vldfm.ondigitalocean.app";
const API_KEY = "177e71e0-2012-48df-9018-383692b9d79b";

// Ta bort kommentarer och kolla i debug konsolen vid felsökning

class Api {
  static Future postTask(Tasks task) async {
    // print(task);
    Map<String, dynamic> json = Tasks.toJson(task);
    var bodyString = jsonEncode(json);
    // print(json);
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body: bodyString,
      headers: {"Content-Type": "application/json"},
    );
    // print('done');
  }

  static Future putTask(Tasks task) async {
    // print(task);
    Map<String, dynamic> json = Tasks.toJson(task);
    var bodyString = jsonEncode(json);
    // print(json);
    await http.put(
      '$API_URL/todos/${task.id}?key=$API_KEY',
      body: bodyString,
      headers: {"Content-Type": "application/json"},
    );
    // print('done');
  }

  static Future deleteTask(Tasks task) async {
    await http.delete('$API_URL/todos/${task.id}?key=$API_KEY');
  }

  static Future<List<Tasks>> getTasks() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    String bodyString = response.body;
    // print(response.body);
    var json = jsonDecode(bodyString);
    // print(json);

    return json.map<Tasks>((data) {
      return Tasks.fromJson(data);
    }).toList();
  }
}
