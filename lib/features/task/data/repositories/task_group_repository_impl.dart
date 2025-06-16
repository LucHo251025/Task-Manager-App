import '../../domain/repositories/task_group_repository.dart';
import '../datasources/task_local_datasources.dart';
import '../../domain/entities/task_group_entity.dart';

class TaskGroupRepositoryImpl implements TaskGroupRepository {
  final TaskLocalDataSource taskLocalDataSource;

  TaskGroupRepositoryImpl({
    required this.taskLocalDataSource,
  });
  @override
  Future<List<TaskGroupEntity>> getTaskGroups() {
    return taskLocalDataSource.getTaskGroups();
  }
}
