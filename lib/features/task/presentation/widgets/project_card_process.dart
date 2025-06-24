import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/domain/entities/project_entity.dart';
import 'package:task_manager_app/features/task/domain/entities/task_entity.dart';
import 'package:task_manager_app/features/task/domain/entities/task_group_entity.dart';

class ProjectCardProcess extends StatelessWidget {
  final TaskGroupEntity group;
  final ProjectEntity projectEntity;
  const ProjectCardProcess({
    super.key,
    required this.group,
    required this.projectEntity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const  Color(0xFFE1F3FF),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  group.name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color:group.iconColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:group.icon
              ),
            ],
          ),
          const SizedBox(height: 8),

          Text(
            projectEntity.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSecondary,
            ),
          ),
          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: projectEntity.tasks.length / 100,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF0094FF)
              ),
            ),
          )
        ],
      ),
    );
  }
}