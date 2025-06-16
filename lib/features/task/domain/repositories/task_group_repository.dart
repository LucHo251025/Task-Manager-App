import '../entities/task_group_entity.dart';

abstract class TaskGroupRepository {
  Future<List<TaskGroupEntity>> getTaskGroups();
}