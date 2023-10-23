import 'package:flutter/material.dart';
import 'package:to_do_list/app/data/models/task_model.dart';

class ViewTaskPage extends StatelessWidget {
  final TaskModel task;

  const ViewTaskPage({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
