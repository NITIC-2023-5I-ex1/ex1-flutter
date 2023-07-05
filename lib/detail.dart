import 'package:ex_1_flutter/todo.dart';
import 'package:flutter/material.dart';

class TODODetail extends StatelessWidget {
  final TODO todo;
  final VoidCallback fn;
  const TODODetail(this.todo, this.fn, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,children: [
          Text(todo.title, style: const TextStyle(fontSize: 23)),
          Text(todo.description, style: const TextStyle(fontSize: 17)),
        ],),
        Row(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(todo.parseDate()),
              Text("優先度: ${todo.priority.toString()}"),
            ],),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: ElevatedButton(onPressed: fn, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)), backgroundColor: Theme.of(context).primaryColor, foregroundColor: Theme.of(context).canvasColor), child: const Text("DONE")),
            ),
          ],
        ),
      ]),
    ),);
  }
}