import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("This is a task, this is where it will go."),
      trailing: Checkbox(
        value: false,
        onChanged: (bool? value) {
          //left blank for now
        },
      ),
    );
  }
}