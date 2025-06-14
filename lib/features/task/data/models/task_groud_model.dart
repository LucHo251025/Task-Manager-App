import '../../domain/entities/task_group_entity.dart';

class TaskGroudModel extends TaskGroupEntity {
  TaskGroudModel({
    required super.id,
    required super.name,
    required super.totalTasks,
    required super.completedTasks,
    required super.icon,
  });

  factory TaskGroudModel.fromJson(Map<String, dynamic> json ){
    return TaskGroudModel(
        id: json['id'],
        name: json['name'],
        totalTasks: json['totalTasks'],
        completedTasks: json['completedTasks'],
        icon: json['icon']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'totalTasks': totalTasks,
      'completedTasks': completedTasks,
      'icon': icon,
    };
  }

}