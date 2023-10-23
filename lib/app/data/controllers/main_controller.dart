import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list/app/models/task_model.dart';

class MainController {
  var tasks$ = ValueNotifier(<TaskModel>[]);

  bool createTask({
    required TaskModel task,
    required String userID,
  }) {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;

      db.collection('tasks').doc(userID).set(
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
