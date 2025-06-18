import 'package:flutter/material.dart';

import '../models/task_groud_model.dart';
import '../models/task_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskLocalDataSource {

  Future<List<TaskGroupModel>> getTaskGroups() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      TaskGroupModel(
        id: '1',
        name: 'Office Project',
        totalTasks: 20,
        completedTasks: 14,
        icon:
        Icon(Icons.padding_rounded),
        iconColor: Colors.pink,
      ),
      TaskGroupModel(
        id: '2',
        name: 'Personal Project',
        totalTasks: 10,
        completedTasks: 5,
        icon: Icon(Icons.padding_rounded),
        iconColor: Colors.blue,
      ),
    ];
  }

  // Future<TaskModel> getTaskGroupById(String id) async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //
  // }
}