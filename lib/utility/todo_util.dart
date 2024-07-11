import 'package:flutter/material.dart';
import 'package:to_do_flutter/pages/home_page.dart';
import 'package:to_do_flutter/pages/todo_page.dart';

class TodoUtil extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  TodoUtil({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),

      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            //Check Box
            Checkbox(
              value: taskCompleted, onChanged: onChanged,
              activeColor: Colors.black,
            ),

            //Task Name
            Text(
              taskName,
              // increase font size

              style: TextStyle(
                decoration: taskCompleted ? TextDecoration.lineThrough : null,
                fontSize: 16,
              )
            ),

          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(10),
        ),

      ),
    );
  }

}