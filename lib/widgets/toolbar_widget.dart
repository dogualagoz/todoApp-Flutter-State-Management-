import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/providers/all_providers.dart';

class ToolbarWidget extends ConsumerWidget {
  const ToolbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onCompletedTodoCount = ref.watch(unCompletedTodoCountProvider);
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
          child: TextButton(onPressed: () {}, child: const Text("All")),
        ),
        Tooltip(
          message: "Only uncompleted todos",
          child: TextButton(onPressed: () {}, child: const Text("Active")),
        ),
        Tooltip(
          message: "Only completed todos",
          child: TextButton(onPressed: () {}, child: const Text("Completed")),
        ),
      ],
    );
  }
}
