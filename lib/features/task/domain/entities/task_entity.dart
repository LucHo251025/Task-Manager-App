class TaskEntity {
  final String id;
  final String projectId;
  final String title;
  final String status; // to_do, in_progress, done
  final DateTime dateTime;

  TaskEntity({
    required this.id,
    required this.projectId,
    required this.title,
    required this.status,
    required this.dateTime,
  });
}