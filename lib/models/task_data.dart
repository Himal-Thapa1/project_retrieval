
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskData extends ChangeNotifier {
  late Database _database;
  List<Task> _tasks = [];

  TaskData() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, 'tasks.db');
  _database = await openDatabase(path, version: 1, onCreate: _createDatabase);

  final hasTasks = await _hasTasks();

  if (!hasTasks) {
    final initialTasks = [
      Task(name: "Add your todo list here."),
      Task(name: "Long press the task to delete the task."),
    ];

    for (final task in initialTasks) {
      await _database.insert(
        'tasks',
        task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }
  }

  _loadTasks();
  }

  Future<bool> _hasTasks() async {
  final count = Sqflite.firstIntValue(
    await _database.rawQuery('SELECT COUNT(*) FROM tasks'),
  );

  return count! > 0;
}

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute(
      'CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, isDone INTEGER)',
    );
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  Future<void> addTask(String newTaskTitle) async {
    final task = Task(name: newTaskTitle);
    await _database.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _loadTasks();
  }

  Future<void> updateTask(Task task) async {
    task.toggleDone();
    await _database.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.name.hashCode],
    );
    _loadTasks();
  }

  Future<void> deleteTask(Task task) async {
    await _database.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [task.name.hashCode],
    );
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final List<Map<String, dynamic>> rows =
        await _database.query('tasks', orderBy: 'id');
    _tasks = rows.map((row) {
      return Task.fromMap(row);
    }).toList();
    notifyListeners();
  }
}

class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': name.hashCode,
      'name': name,
      'isDone': isDone ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'],
      isDone: map['isDone'] == 1,
    );
  }
}
