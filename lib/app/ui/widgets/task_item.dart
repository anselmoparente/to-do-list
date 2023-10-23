import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/app/data/controllers/main_controller.dart';
import 'package:to_do_list/app/data/services/auth_service.dart';
import 'package:to_do_list/app/models/task_model.dart';

class TaskItem extends StatefulWidget {
  final TaskModel task;
  final MainController mainController;

  const TaskItem({
    required this.task,
    required this.mainController,
    super.key,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task.title),
      subtitle: Text(
        widget.task.description!,
        overflow: TextOverflow.ellipsis,
      ),
      leading: widget.task.isCompleted
          ? CircleAvatar(
              backgroundColor: Colors.green.withOpacity(0.2),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'C',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          : Checkbox(
              value: widget.task.isCompleted,
              onChanged: (bool? value) =>
                  widget.mainController.changeIsComplete(
                task: widget.task,
                userID: context.read<AuthService>().user!.uid,
              ),
            ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => setState(() {
          widget.mainController.deleteTask(
            task: widget.task,
            userID: context.read<AuthService>().user!.uid,
          );
        }),
      ),
      onTap: () {},
    );
  }
}
