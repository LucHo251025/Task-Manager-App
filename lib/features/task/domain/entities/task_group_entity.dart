import 'package:flutter/cupertino.dart';
import 'package:task_manager_app/features/task/domain/entities/project_entity.dart';

class TaskGroupEntity {
  final String id;
  final String name;
  final List<ProjectEntity> projects ;
  final Icon icon;
  final Color? iconColor;

  TaskGroupEntity({
    required this.id,
    required this.name,
    required this.projects,
    required this.icon,
    required this.iconColor,
  });
}