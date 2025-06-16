part of 'task_group_cubit.dart';

abstract class TaskGroupState {}

class TaskGroupInitial extends TaskGroupState {}

class TaskGroupLoading extends TaskGroupState {}

class TaskGroupLoaded extends TaskGroupState {
  final List<TaskGroupEntity> groups;

  TaskGroupLoaded(this.groups);
}