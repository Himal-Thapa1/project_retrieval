import 'package:flutter/material.dart';
import 'package:project_retrieval/widgets/task_tile.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            isChecked: task.isDone,
            taskTitle: task.name,
            checkboxCallBack: (bool checkboxState) {
              taskData.updateTask(task);
            },
            // longPressCallBack: () {
            //   taskData.deleteTask(task);
            // },
            onLongPress: () {
              // Instead of calling taskData.deleteTask(task) here,
              // you can show a confirmation dialog or perform the deletion logic.
              // This avoids direct UI modification during build.
              // Example of showing a confirmation dialog:
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Confirm Delete"),
                  content: Text("Are you sure you want to delete this task?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        taskData.deleteTask(task);
                        Navigator.pop(context);
                      },
                      child: Text("Delete"),
                    ),
                  ],
                ),
              );
            },
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
