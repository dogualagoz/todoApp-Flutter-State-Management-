import 'package:flutter_riverpod/legacy.dart';
import 'package:state_management/models/todo_model.dart';
import 'package:state_management/providers/todo_list_manager.dart';
import 'package:uuid/uuid.dart';

final todoListProvider = StateNotifierProvider<TodoListManager, List<TodoModel>>((ref) {
  return TodoListManager(
    [
    TodoModel(id: const Uuid().v4(), description: "Spora git"),
    TodoModel(id: const Uuid().v4(), description: "Kitap oku"),
    TodoModel(id: const Uuid().v4(), description: "Ders çalış"),
    TodoModel(id: const Uuid().v4(), description: "Tv izle"),
    ]
  );
});