import 'package:task_manager_app/features/task/data/models/task_model.dart';
import 'package:task_manager_app/features/task/domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel({
    required super.id,
    required super.name,
    required super.description,
    required super.startDate,
    required super.endDate,
    required super.groupId,
    required super.tasks,
    required super.status,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      tasks: (json['tasks'] as List)
          .map((task) => TaskModel.fromJson(task))
          .toList(),
      groupId: json['groupId'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'groupId': groupId,
      'status': status,
    };
  }

}