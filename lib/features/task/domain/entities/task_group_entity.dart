import 'package:flutter/cupertino.dart';

class TaskGroupEntity {
  final String id;
  final String name;
  final int totalTasks;
  final int completedTasks;
  final Icon icon;
  final Color? iconColor;

  TaskGroupEntity({
    required this.id,
    required this.name,
    required this.totalTasks,
    required this.completedTasks,
    required this.icon,
    required this.iconColor,
  });
}