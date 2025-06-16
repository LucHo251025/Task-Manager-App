// task_group_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/task_group_entity.dart';
import '../../domain/usecases/get_task_group.dart';
part 'task_group_state.dart';

class TaskGroupCubit extends Cubit<TaskGroupState> {
  final GetTaskGroups getTaskGroupsUseCase;

  TaskGroupCubit(this.getTaskGroupsUseCase) : super(TaskGroupInitial());

  Future<void> fetchTaskGroups() async {
    emit(TaskGroupLoading());
    final result = await getTaskGroupsUseCase();
    emit(TaskGroupLoaded(result));
  }
}
