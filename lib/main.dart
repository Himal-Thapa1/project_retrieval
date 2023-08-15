import 'package:flutter/material.dart';
import 'package:project_retrieval/models/task_data.dart';
import 'package:project_retrieval/screens/taskscreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(), // Use `create` instead of `builder` (for newer versions of Provider)
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
