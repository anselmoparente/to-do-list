import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/app/data/controllers/main_controller.dart';
import 'package:to_do_list/app/data/services/auth_service.dart';
import 'package:to_do_list/app/models/task_model.dart';
import 'package:to_do_list/app/ui/theme/design_system.dart';
import 'package:to_do_list/app/ui/widgets/custom_text_form_field.dart';

class AddTaskPage extends StatefulWidget {
  final MainController mainController;

  const AddTaskPage({
    super.key,
    required this.mainController,
  });

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToDoColors.backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Adicionar Tarefa'),
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
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: description,
                hintText: 'Descrição(Opcional)',
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: (MediaQuery.of(context).size.width / 2),
          height: 48.0,
          child: ElevatedButton(
            onPressed: () {
              if (title.text.isNotEmpty) {
                final response = widget.mainController.createTask(
                  task: TaskModel(
                    id: UniqueKey().toString(),
                    title: title.text,
                    description: description.text,
                  ),
                  userID: context.read<AuthService>().user!.uid,
                );

                if (response == true) {
                  Navigator.pop(context);

                  const snackBar = SnackBar(
                    content: Text('Task criada!'),
                    duration: Duration(seconds: 2), // Duração do Snackbar
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  const snackBar = SnackBar(
                    content: Text('Um erro inesperado aconteceu!'),
                    duration: Duration(seconds: 2), // Duração do Snackbar
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              } else {
                const snackBar = SnackBar(
                  content: Text('Adicione um título!'),
                  duration: Duration(seconds: 2), // Duração do Snackbar
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.grey.shade50),
              elevation: const MaterialStatePropertyAll(6.0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            child: const Text(
              'Criar',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
