import 'package:flutter/material.dart';
import '../Comp/dialog_box.dart';
import '../Comp/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //contoller
  final _controller = TextEditingController();

  //List of Task
  List toDoList = [
    ["Make a Cake", false],
    ["Take Shower", false],
  ];

  //checkBox Changed function
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //savenew Task
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //Create Task
  void createTask (){
    showDialog(
    context: context, 
    builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    }
    );
  }

  //delete function
  void deleteTask (int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TODO APP"),
        elevation: 0,
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: createTask,
      child: Icon(Icons.add),
    ),

      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index) ,

            );
          },
      ),
    );
  }
}