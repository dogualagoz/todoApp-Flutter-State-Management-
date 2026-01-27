import 'package:flutter/material.dart';
import 'package:state_management/models/todo_model.dart';

class TodoListItemWidget extends StatelessWidget {
  final TodoModel item;
  const TodoListItemWidget({super.key, required this.item});
  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: true, onChanged: (value){}),
      title: Text(item.description),
    );
  }
}