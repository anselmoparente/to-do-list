import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/app/data/controllers/main_controller.dart';
import 'package:to_do_list/app/data/services/auth_service.dart';
import 'package:to_do_list/app/ui/theme/design_system.dart';
import 'package:to_do_list/app/ui/widgets/task_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MainController mainController;

  @override
  Widget build(BuildContext context) {
    mainController = context.watch<MainController>();

    return Scaffold(
      backgroundColor: ToDoColors.backgroundColor,
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
      body: FutureBuilder(
        future: mainController.getTasks(
          userID: context.read<AuthService>().user!.uid,
        ),
        builder: (context, snapshot) {
          if (mainController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return mainController.tasks.isEmpty
              ? const Center(
                  child: Text('Nenhuma tarefa encontrada.'),
                )
              : ListView.builder(
                  itemCount: mainController.tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(16.0),
                      color: Colors.white,
                      child: TaskItem(
                        task: mainController.tasks[index],
                        mainController: mainController,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
