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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add TODO"),),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(hintText: "Title"), onChanged: (String text) {
            _title = text;
          },
          controller: _titleController),
          TextField(decoration: InputDecoration(hintText: "Description"), onChanged: (String text) {
            _desc = text;
          },
          controller: _descController),
          TextField(decoration: InputDecoration(hintText: "Priority"), inputFormatters: [FilteringTextInputFormatter.digitsOnly], onChanged: (String text) {
            _priority = int.parse(text);
          }, controller: _priorityController),
          TextButton(onPressed: () async {
            final date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
            if (date != null) {
              _dueDate = date;
            }
          }, child: Text("Due date")),
          TextButton(onPressed: () {
            Navigator.pop(context, TODO(_title, _desc, _priority, _dueDate));
          }, child: Text("Add"))
        ],
      ),
    );
  }
}