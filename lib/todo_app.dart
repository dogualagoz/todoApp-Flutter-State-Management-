import 'package:flutter/material.dart';
import 'package:state_management/widgets/title_widget.dart';
import 'package:state_management/widgets/todo_list_item_widget.dart';
import 'package:state_management/widgets/toolbar_widget.dart';

class TodoApp extends StatelessWidget {
  TodoApp({super.key});
  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView(
          children: [
            const TitleWidget(),
            TextField(
              controller: newTodoController,
              decoration: InputDecoration(labelText: "Bugün neler yapacaksın ?"),
              onSubmitted: (newTodo){
                debugPrint('sunu ekle $newTodo');
              },
            ),
            const SizedBox(height: 20,),
            const ToolbarWidget(),
            const TodoListItemWidget(),
            

              
          ],
        ),
      ),
    );
  }
}
