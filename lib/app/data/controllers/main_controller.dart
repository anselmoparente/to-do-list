import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list/app/models/task_model.dart';

class MainController {
  var tasks$ = ValueNotifier(<TaskModel>[]);

  Future<void> getTasks({
    required String userID,
  }) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot query = await db.collection(userID).get();
    for (var element in query.docs) {
      tasks$.value.add(
        TaskModel(
          id: element.get('id'),
          title: element.get('title'),
          description: element.get('description'),
          isComplete: element.get('isComplete'),
        ),
      );
    }
  }

  bool createTask({
    required TaskModel task,
    required String userID,
  }) {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;

      db.collection(userID).doc(task.id).set(
        {
          'id': task.id,
          'title': task.title,
          'description': task.description,
          'isComplete': task.isComplete,
        },
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
