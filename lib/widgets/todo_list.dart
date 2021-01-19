import 'package:ToDoApp/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoList extends StatefulWidget {
  final List<ToDo> todos;
  ToDoList(this.todos);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  // bool value;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              // leading: Checkbox(
              //   value: true,
              //   onChanged: (bool newvalue) {
              //     value = newvalue;
              //   },

              // title: Text("Read"),
              // subtitle: Text("Jan 12"),
              title: Text(widget.todos[index].todo),
              subtitle:
                  Text('${DateFormat.yMd().format(widget.todos[index].date)}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
