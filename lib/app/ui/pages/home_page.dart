import 'package:flutter/material.dart';
import 'package:to_do_list/app/data/controllers/main_controller.dart';
import 'package:to_do_list/app/ui/theme/design_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainController mainController = MainController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(
              '/add-task',
              arguments: mainController,
            ),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: mainController.tasks$.value.isEmpty
          ? const Center(
              child: Text('Nenhuma tarefa encontrada.'),
            )
          : ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return Text(index.toString());
              },
            ),
    );
  }
}
