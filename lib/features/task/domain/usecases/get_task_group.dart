import '../entities/task_group_entity.dart';
import '../repositories/task_group_repository.dart';

class GetTaskGroups {
  final TaskGroupRepository repository;
  GetTaskGroups({required this.repository});

  Future<List<TaskGroupEntity>> call() async {
    return await repository.getTaskGroups();
  }
}