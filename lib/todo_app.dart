import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/models/todo_model.dart';
import 'package:state_management/providers/all_providers.dart';
import 'package:state_management/widgets/title_widget.dart';
import 'package:state_management/widgets/todo_list_item_widget.dart';
import 'package:state_management/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({super.key});
  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(todoListProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView(
          children: [
            const TitleWidget(),
            TextField(
              controller: newTodoController,
              decoration: InputDecoration(
                labelText: "Bugün neler yapacaksın ?",
              ),
              onSubmitted: (newTodo) {
                ref.read(todoListProvider.notifier).addTodo(newTodo);
              },
            ),
            const SizedBox(height: 20),
            const ToolbarWidget(),
            for (var i = 0; i < allTodos.length; i++)
              Dismissible(
                key: ValueKey(allTodos[i].id),
                child: ProviderScope(
                  overrides: [
                    currentTodoProvider.overrideWithValue(allTodos[i]),
                  ],
                  child: const TodoListItemWidget(),
                ),
                onDismissed: (direction) {
                  ref.read(todoListProvider.notifier).remove(allTodos[i]);
                },
              ),
          ],
        ),
      ),
    );
  }
}
