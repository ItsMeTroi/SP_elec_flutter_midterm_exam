// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:cahilog_midterm_exam/todo.dart';
import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  
  final ToDo todo;
  final onToDoChange;
  final onDeleteItem;
  
  const ToDoItem({Key? key, required this.todo, required this.onToDoChange, required this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          tileColor: Colors.lightGreenAccent,

          //checkbox
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.black,
            ),
          
          //data
          title: Text(
            todo.todoText!,
                style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                decoration: todo.isDone? TextDecoration.lineThrough : null,
              ),
            ),

          //deletebutton
          trailing: Container(
            padding: EdgeInsets.all(0),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              iconSize: 20,
              color: Colors.white,
              onPressed: () {
                onDeleteItem(todo.id);
              },
              icon: Icon(Icons.delete),
              ),
          ),
      ),
    );
  }
}