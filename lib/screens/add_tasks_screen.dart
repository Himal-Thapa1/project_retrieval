import 'package:flutter/material.dart';
import 'package:project_retrieval/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}
class _AddTaskScreenState extends State<AddTaskScreen> {
  late String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Text(
                "Add Task",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(),
                keyboardType: TextInputType.multiline,
                maxLines: null, // <-- SEE HERE
                onChanged: (newText){
                  newTaskTitle = newText;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                    Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                    Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
