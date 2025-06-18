import '../../domain/entities/task_group_entity.dart';

class TaskGroupModel extends TaskGroupEntity {
  TaskGroupModel({
    required super.id,
    required super.name,
    required super.totalTasks,
    required super.completedTasks,
    required super.icon,
    required super.iconColor,
  });

  factory TaskGroupModel.fromJson(Map<String, dynamic> json) {
    return TaskGroupModel(
        id: json['id'],
        name: json['name'],
        totalTasks: json['totalTasks'],
        completedTasks: json['completedTasks'],
        icon: json['icon'],
        iconColor: json['iconColor']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'totalTasks': totalTasks,
      'completedTasks': completedTasks,
      'icon': icon,
      'iconColor': iconColor,
    };
  }
}
