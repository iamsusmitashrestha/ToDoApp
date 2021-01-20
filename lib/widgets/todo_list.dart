import 'package:ToDoApp/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToDoList extends StatefulWidget {
  final List<ToDo> todos;
  final Function delTodo;

  ToDoList(this.todos, this.delTodo);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            elevation: 5,
            child: CheckboxListTile(
              title: Text(
                widget.todos[index].todo,
                style: TextStyle(
                  decoration: widget.todos[index].done == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color:
                      widget.todos[index].done ? Colors.black45 : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Row(
                children: [
                  widget.todos[index].dateTime.isBefore(DateTime.now())
                      ? Text(
                          "Overdue",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )
                      : Text(DateFormat("MMM d, h:mm a")
                          .format(widget.todos[index].dateTime)),
                ],
              ),
              secondary: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.delTodo(widget.todos[index].id),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: widget.todos[index].done,
              onChanged: (bool value) {
                setState(() {
                  widget.todos[index].done = value;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
