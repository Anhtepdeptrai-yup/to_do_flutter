import 'package:flutter/material.dart';
import 'package:to_do_flutter/utility/todo_util.dart';
import 'package:to_do_flutter/utility/dialog_box.dart';

//stateless
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // text controller
  final _controller = TextEditingController();

  List todoTasks = [
    ['Do the laundry', false],
    ['Wash the dishes', true],
  ];

  // checkboxchange == checkbox was clicked
  void checkBoxChange(bool? value, int index) {
    setState(() {
      todoTasks[index][1] = !todoTasks[index][1];
    });
  }

  //save new task
  void saveNewTask() {
    setState(() {
      todoTasks.add([_controller.text, false]);
      _controller.clear();
      Navigator.pop(context);
    });
  }

  // create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.pop(context),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],

      appBar: AppBar(
        title: Text(
          'TO DO LIST',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color(0xFF273746),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[200],
      ),

      body: ListView.builder(
        itemCount: todoTasks.length,
        itemBuilder: (context, index) {
          return TodoUtil(
              taskName: todoTasks[index][0],
              taskCompleted: todoTasks[index][1],
              onChanged: (value) => checkBoxChange(value, index),
          );
        }

      ),

      floatingActionButton: FloatingActionButton(
        onPressed:() {
          createNewTask();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[400],
        shape: CircleBorder(),
      )
    );
  }
}