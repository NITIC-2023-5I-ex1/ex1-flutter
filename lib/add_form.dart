import 'dart:html';

import 'package:flutter/material.dart';

class AddForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddFormState();

}

class _AddFormState extends State<AddForm> {
  String _title = "";
  String _desc = "";
  int _priority = 0;
  DateTime _dueDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add TODO"),),
      body: Stack(
        children: [
          TextField(),
          TextField(),
          TextField(),
          TextButton(onPressed: () => {}, child: Text("Add"))
        ],
      ),
    );
  }
}