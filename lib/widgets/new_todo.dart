import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewToDo extends StatefulWidget {
  final Function addNewTodo;

  NewToDo(this.addNewTodo);
  @override
  _NewToDoState createState() => _NewToDoState();
}

class _NewToDoState extends State<NewToDo> {
  final _todoController = TextEditingController();

  DateTime _selectedDate;

  void _showDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    // );
  }

  void _submitData() {
    final enteredTodo = _todoController.text;

    if (enteredTodo.isEmpty || _selectedDate == null) {
      print("hELLO");
      return;
    }
    print("hELLO BY");

    widget.addNewTodo(enteredTodo, _selectedDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "To-do",
            ),
            controller: _todoController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _selectedDate == null
                  ? Text("No date chosen !")
                  : Text(
                      'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
              FlatButton(
                onPressed: _showDate,
                child: Text(
                  "Pick Date",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: RaisedButton(
              onPressed: _submitData,
              child: Text(
                "Add To-do",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
