import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list/app/models/task_model.dart';

class MainController extends ChangeNotifier {
  final List<TaskModel> _tasks = <TaskModel>[];
  List<TaskModel> get tasks => _tasks.toList();

  Future<void> getTasks({
    required String userID,
  }) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot query = await db.collection(userID).get();

    _tasks.clear();

    for (var element in query.docs) {
      _tasks.add(
        TaskModel(
          id: element.get('id'),
          title: element.get('title'),
          description: element.get('description'),
          isCompleted: element.get('isCompleted'),
        ),
      );
    }

    notifyListeners();
  }

  bool createTask({
    required TaskModel task,
    required String userID,
  }) {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;

      _tasks.add(task);

      db.collection(userID).doc(task.id).set(
        {
          'id': task.id,
          'title': task.title,
          'description': task.description,
          'isCompleted': task.isCompleted,
        },
      );

      notifyListeners();

      return true;
    } catch (e) {
      return false;
    }
  }

  bool updateTask({
    required TaskModel task,
    required String userID,
  }) {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;

      db.collection(userID).doc(task.id).update({
        'title': task.title,
        'description': task.description,
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  void deleteTask({
    required TaskModel task,
    required String userID,
  }) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    _tasks.remove(task);

    db.collection(userID).doc(task.id).delete();

    notifyListeners();
  }

  void changeIsComplete({
    required TaskModel task,
    required String userID,
  }) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    task.isCompleted = true;

    db.collection(userID).doc(task.id).update({
      'isCompleted': task.isCompleted,
    });

    notifyListeners();
  }
}
