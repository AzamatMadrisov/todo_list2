import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDochanged;
  final onDeleteItem;
  const ToDoItem(
      {Key? key, required this.todo, this.onToDochanged, this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          onToDochanged(todo);
        },
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          size: 30,
          color: Colors.blue,
        ),
        title: Text(todo.todoText!,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                decoration: todo.isDone ? TextDecoration.lineThrough : null)),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 8),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
              iconSize: 20,
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () {
                onDeleteItem(todo.id);
              },
              color: Colors.white),
        ),
      ),
    );
  }
}
