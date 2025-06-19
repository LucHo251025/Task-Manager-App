import 'package:task_manager_app/features/task/domain/entities/task_entity.dart';

class ProjectEntity {
  final String id;
  final String groupId;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final List<TaskEntity> tasks;
  final String status;

  ProjectEntity({
    required this.id,
    required this.groupId,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.tasks,
    required this.status,
  });
}