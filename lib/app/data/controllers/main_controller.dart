import 'package:flutter/material.dart';
import 'package:to_do_list/app/models/task_model.dart';

class MainController {
  var tasks$ = ValueNotifier(<TaskModel>[]);

  void createTask({
    required TaskModel task,
  }) {
    print(task.title);
  }
}
