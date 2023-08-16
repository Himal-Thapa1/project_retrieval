import 'package:project_retrieval/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
    List<Task> tasks = [
    Task(name: "do TASK 1"),
    Task(name: "Do task 2"),
    Task(name: "Do task 3"),
  ];

  int get taskCount {
    return tasks.length;
  }
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    tasks.add(task);
    notifyListeners();
  }

}