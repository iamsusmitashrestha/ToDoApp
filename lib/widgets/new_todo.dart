import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewToDo extends StatefulWidget {
  final Function addNewTodo;

  NewToDo(this.addNewTodo);

  @override
  _NewToDoState createState() => _NewToDoState();
}

class _NewToDoState extends State<NewToDo> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedTime = DateTime.now();
  final _todoController = TextEditingController();

  void _submitData() {
    final enteredTodo = _todoController.text;

    if (enteredTodo.isEmpty || selectedTime == null || selectedDate == null) {
      print("hELLO");
      return;
    }

    widget.addNewTodo(enteredTodo, selectedTime);
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
              selectedDate == null
                  ? Text("No date chosen !")
                  : Text(
                      'Picked Date: ${DateFormat.MMMd().format(selectedDate)}'),
              FlatButton(
                onPressed: () => showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                ).then((pickedDate) {
                  if (pickedDate == null) {
                    return;
                  }

                  setState(() {
                    selectedDate = pickedDate;
                  });
                }),
                // );

                child: Text(
                  "Pick Date",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              selectedTime == null
                  ? Text("No Time chosen !")
                  : Text(
                      'Picked Time: ${DateFormat.Hm().format(selectedTime)}'),
              FlatButton(
                onPressed: () => showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((pickedTime) {
                  if (pickedTime == null) {
                    return;
                  }
                  setState(() {
                    selectedTime = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        pickedTime.hour,
                        pickedTime.minute);
                  });
                  print('\n${selectedTime.toString()}');
                }),
                // );

                child: Text(
                  "Pick Time",
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
