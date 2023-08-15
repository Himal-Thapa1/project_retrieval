import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  late final bool isChecked;
  late final String taskTitle;
  final Function checkboxCallBack;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newValue) {
          checkboxCallBack(newValue);
        },
      ),
    );
  }
}
