import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/domain/entities/task_group_entity.dart';
import 'package:task_manager_app/features/task/presentation/widgets/project_card_process.dart';

class HorizontalProjectList extends StatelessWidget {
  final List<TaskGroupEntity> groupList;

  const HorizontalProjectList({
    super.key,
    required this.groupList,
  });

  @override
  Widget build(BuildContext context) {
    final processingPairs = groupList
        .expand((group) => group.projects
        .where((project) => project.status == 'isProcess')
        .map((project) => MapEntry(group, project)))
        .toList();
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: processingPairs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final pair = processingPairs[index];
          return SizedBox(
            width: 250,
            child: ProjectCardProcess(
              group: pair.key,
              projectEntity: pair.value,
            ),
          );
        },
      ),
    );
  }
}