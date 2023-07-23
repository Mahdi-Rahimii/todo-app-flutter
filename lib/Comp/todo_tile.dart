import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class ToDoTile extends StatelessWidget {
    final String taskName;
    final bool taskCompleted;
    Function (bool?)? onChanged;
    Function (BuildContext)? deleteFunction;


  
   ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete_forever_rounded,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              //CheckBox
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.red,
                ),
              //Task text
              Text(
                taskName,
                style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
                ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10)
            ),
        ),
      ),
    );
  }
}