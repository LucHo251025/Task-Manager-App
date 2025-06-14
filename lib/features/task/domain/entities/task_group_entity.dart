class TaskGroupEntity {
  final String id;
  final String name;
  final int totalTasks;
  final int completedTasks;
  final String icon;

  TaskGroupEntity({
    required this.id,
    required this.name,
    required this.totalTasks,
    required this.completedTasks,
    required this.icon,
  });
}