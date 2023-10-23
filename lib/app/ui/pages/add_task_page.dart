import 'package:flutter/material.dart';
import 'package:to_do_list/app/ui/theme/design_system.dart';
import 'package:to_do_list/app/ui/widgets/custom_text_form_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

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
                hintText: 'Descrição',
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
            onPressed: () => print(title.text),
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
              'Salvar',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
