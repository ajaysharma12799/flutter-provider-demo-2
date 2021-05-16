import 'package:flutter/material.dart';

class TaskItem {
  final String title;
  final String description;

  TaskItem({
    @required this.title,
    @required this.description,
  });
}

class TaskProvider with ChangeNotifier {
  List<TaskItem> taskItem = [];

  void addTaskItem(String title, String description) {
    TaskItem _newTask = TaskItem(title: title, description: description);
    taskItem.add(_newTask);
    notifyListeners();
  }
}
