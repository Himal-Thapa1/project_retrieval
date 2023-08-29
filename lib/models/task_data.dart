import 'dart:collection';

import 'package:project_retrieval/models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Add your todo list here."),
    Task(name: "Long press the task to delete the task."),
  ];

  TaskData(){
    _loadTasks();
  }
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    _saveTasks();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    _saveTasks();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    _saveTasks();
    notifyListeners();
  }

  void updateTasksFromStrings(List<String> taskNames) {
    _tasks = taskNames.map((name) => Task(name: name)).toList();
    notifyListeners();
  }
   Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskNames = _tasks.map((task) => task.name).toList();
    await prefs.setStringList('tasks', taskNames);
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskNames = prefs.getStringList('tasks') ?? [];
    _tasks = taskNames.map((name) => Task(name: name)).toList();
    notifyListeners();
  }

}
