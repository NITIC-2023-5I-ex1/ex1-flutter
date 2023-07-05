import 'package:ex_1_flutter/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  String _title = "";
  String _desc = "";
  int _priority = 0;
  DateTime _dueDate = DateTime.now();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();

  InputDecoration _createInputDecoration(String hint) {
    return InputDecoration(hintText: hint);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add TODO")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                      decoration: _createInputDecoration("Title"),
                      onChanged: (String text) {
                        _title = text;
                      },
                      controller: _titleController),
                ),
                SizedBox(
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: TextField(
                        decoration: _createInputDecoration("Priority"),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String text) {
                          _priority = int.parse(text);
                        },
                        controller: _priorityController),
                  ),
                ),
              ],
            ),
            TextField(
                decoration: _createInputDecoration("Description"),
                onChanged: (String text) {
                  _desc = text;
                },
                maxLines: 5,
                controller: _descController),
            Row(
              children: [
                const Text(
                  "DueDate ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Text("${_dueDate.year}/${_dueDate.month}/${_dueDate.day}"),
                TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        _dueDate = date;
                      }
                    },
                    child: const Text("Set date")),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Theme.of(context).canvasColor),
                onPressed: () {
                  Navigator.pop(
                      context, TODO(_title, _desc, _priority, _dueDate));
                },
                child: const Text("Add"))
          ],
        ),
      ),
    );
  }
}
