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
      dateTime: chosenDate,
      done: false,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTodos.add(newTodo);
    });
  }

  void _delTodo(String id) {
    setState(() {
      _userTodos.removeWhere((todo) => todo.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do"),
      ),
      body: ToDoList(_userTodos, _delTodo),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Wrap(
                    children: [
                      NewToDo(_addNewTodo),
                    ],
                  ),
                );
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
