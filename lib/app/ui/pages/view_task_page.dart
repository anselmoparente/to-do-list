import 'package:flutter/material.dart';
import 'package:to_do_list/app/data/models/task_model.dart';
import 'package:to_do_list/app/ui/theme/design_system.dart';
import 'package:to_do_list/app/ui/widgets/custom_text_form_field.dart';

class ViewTaskPage extends StatefulWidget {
  final TaskModel task;

  const ViewTaskPage({
    super.key,
    required this.task,
  });

  @override
  State<ViewTaskPage> createState() => _ViewTaskPageState();
}

class _ViewTaskPageState extends State<ViewTaskPage> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  void initState() {
    title.text = widget.task.title;
    description.text = widget.task.description ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToDoColors.backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Visualizar Tarefa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFormField(
                controller: title,
                hintText: 'Título',
                readOnly: true,
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: description,
                hintText: 'Descrição(Opcional)',
                maxLines: 5,
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
