// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_element, unused_field, unused_local_variable

import 'package:cahilog_midterm_exam/todo.dart';
import 'package:cahilog_midterm_exam/todo_items.dart';
import 'package:flutter/material.dart';

class Home1 extends StatefulWidget {
  Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundItem = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundItem = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green, Colors.yellow
                ],
              ),
            ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildAppBar(),

        body:Stack(
          children: [
            Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15
                  ),
                    child: Column(
                      children: [
                        searchField(),
                        Expanded(
                    child: ListView(
                            children: [
                              // Title
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20,
                                    bottom: 20,
                                  ),
                                  child: Text(
                                    'To Do List',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                ),
                              ),

                              for ( ToDo todo in _foundItem)
                              ToDoItem(
                                todo: todo,
                                onToDoChange: _handleToDoChange,
                                onDeleteItem: _deleteToDoItem,
                                ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                          left: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [ BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                              ),],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        child: TextField(
                          controller: _todoController,
                          decoration: InputDecoration(
                          hintText: 'Add new task',
                          border: InputBorder.none),
                              ),
                          ),
                      ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                        right: 20,  
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _addToDoItem(_todoController.text);
                        },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: Size(60, 60),
                            elevation: 10,
                          ),
                        child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 40,
                              ),
                              ),
                      ),
                    ),
                  ]),
              )
          ],
        ),
        ),
    );
  }

  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo){
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo
      ));
    });
    _todoController.clear();
  }

  void _filterList(String enteredKeyword){
      List<ToDo> results = [];
      if(enteredKeyword.isEmpty){
        results = todosList;
      }else{
        results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      }

      setState(() {
      _foundItem = results;
    });
  }

  Widget searchField(){
    return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextField(
                    onChanged: (value) => _filterList(value),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black38,
                        size: 20,
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 20,
                          minWidth: 25,
                          ),
                          border: InputBorder.none,
                          hintText: 'Search'
                    ),
                  ),
                );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.green,
      );
  }
}