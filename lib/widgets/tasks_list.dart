import 'package:flutter/material.dart';
import 'package:project_retrieval/widgets/task_tile.dart';
import '../models/task.dart';


class TasksList extends StatefulWidget {
  const TasksList({
    super.key,
  });

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  List<Task> task = [
    Task(name: "do TASK 1"),
    Task(name: "Do task 2"),
    Task(name: "Do task 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TaskTile(),
        TaskTile(),
        TaskTile(),
      ],
    );
  }
}
