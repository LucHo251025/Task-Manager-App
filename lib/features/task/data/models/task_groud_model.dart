import 'package:task_manager_app/features/task/data/models/project_model.dart';

import '../../domain/entities/task_group_entity.dart';

class TaskGroupModel extends TaskGroupEntity {
  TaskGroupModel({
    required super.id,
    required super.name,
    required super.projects,
    required super.icon,
    required super.iconColor,
  });

  factory TaskGroupModel.fromJson(Map<String, dynamic> json) {
    return TaskGroupModel(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        projects: (json['projects'] as List)
            .map((project) => ProjectModel.fromJson(project))
            .toList(),
        iconColor: json['iconColor']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'projects': projects.map((project) => (project as ProjectModel).toJson()).toList(),
      'icon': icon,
      'iconColor': iconColor,
    };
  }
}
