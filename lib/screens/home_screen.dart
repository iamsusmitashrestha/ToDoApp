import 'package:ToDoApp/models/todo.dart';
import 'package:ToDoApp/widgets/new_todo.dart';
import 'package:ToDoApp/widgets/todo_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDo> _userTodos = [];

  void _addNewTodo(String todo, DateTime chosenDate) {
    final newTodo = ToDo(
      todo: todo,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    print("Hi");
    setState(() {
      _userTodos.add(newTodo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do"),
      ),
      body: ToDoList(_userTodos),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return NewToDo(_addNewTodo);
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
