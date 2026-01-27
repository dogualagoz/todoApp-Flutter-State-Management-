import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/providers/all_providers.dart';

class ToolbarWidget extends ConsumerWidget {
  ToolbarWidget({super.key});

  Color changeTextColor(TodoListFilter filt, TodoListFilter currentFilter) {
    if (currentFilter == filt) {
      return Colors.orange;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onCompletedTodoCount = ref.watch(unCompletedTodoCountProvider);
    final currentFilter = ref.watch(todoListFilter);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            onCompletedTodoCount == 0
                ? "All todos completed"
                : "${onCompletedTodoCount.toString()} Todos left",
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Tooltip(
          message: "All Todos",
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: changeTextColor(
                TodoListFilter.all,
                currentFilter,
              ),
            ),
            onPressed: () {
              ref.read(todoListFilter.notifier).state = TodoListFilter.all;
            },
            child: const Text("All"),
          ),
        ),
        Tooltip(
          message: "Only uncompleted todos",
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: changeTextColor(
                TodoListFilter.active,
                currentFilter,
              ),
            ),
            onPressed: () {
              ref.read(todoListFilter.notifier).state = TodoListFilter.active;
            },
            child: const Text("Active"),
          ),
        ),
        Tooltip(
          message: "Only completed todos",
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: changeTextColor(
                TodoListFilter.completed,
                currentFilter,
              ),
            ),
            onPressed: () {
              ref.read(todoListFilter.notifier).state =
                  TodoListFilter.completed;
            },
            child: const Text("Completed"),
          ),
        ),
      ],
    );
  }
}
