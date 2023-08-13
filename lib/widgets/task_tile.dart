import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

    late final bool isChecked;
    late final String taskTitle;

    TaskTile ({required this.isChecked, required this.taskTitle});


    // void checkboxCallBack (bool? checkBoxState) {
    //   // setState(() {
    //   //   isChecked = checkBoxState ?? true;
    //   // });
    // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked? TextDecoration.lineThrough: null,
        ),
      ),
      // trailing: TaskCheckBox(isChecked, checkboxCallBack),
      trailing: Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: isChecked, onChanged: (bool? value) { 
        //left blank for now
       },
      // onChanged: toggleCheckboxState,
    ),
    );
  }
}

// class TaskCheckBox extends StatelessWidget {
//   late final bool checkBoxState;
//   final Function(bool?) toggleCheckboxState;

//   TaskCheckBox(this.checkBoxState, this.toggleCheckboxState);

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.lightBlueAccent,
//       value: checkBoxState,
//       onChanged: toggleCheckboxState,
//     );
//   }
// }
