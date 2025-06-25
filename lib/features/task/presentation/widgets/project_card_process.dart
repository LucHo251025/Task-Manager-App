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
  Map<String, Color> getColorByGroupName(String name) {
    switch(name) {
      case 'Office Project':
        return {
          'processColor': Color(0xFF0094FF),
          'color': Color(0xFFE1F3FF),
        };
      case 'Personal Project':
        return {
          'processColor': Color(0xFFFF6B1D),
          'color': Color(0xFFFFE9E0),
        };
        case 'Daily Studio':
        return {
          'processColor': Color(0xFF6B1DFF),
          'color': Color(0xFFF0EFFF),
        };
      default:
        return {
          'processColor': Colors.grey.shade200,
          'color': Colors.grey,
        };
    }
  }

  Map<String, Color> getColorIconByGroupName(String name) {
    switch(name) {
      case 'Office Project':
        return {
          'icon': Color(0xFFF46AA0),
          'color': Color(0xFFFEE7F0),
        };
      case 'Personal Project':
        return {
          'icon': Color(0xFF9B6EF3),
          'color': Color(0xFFF1EAFE),
        };
      case 'Daily Studio':
        return {
          'icon': Color(0xFFF78A34),
          'color': Color(0xFFFFEADB),
        };
      default:
        return {
          'icon': Colors.grey.shade200,
          'color': Colors.grey,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final groupColors = getColorByGroupName(group.name);
    final groupIconColors = getColorIconByGroupName(group.name);
    Icon themedIcon = group.icon is Icon
        ? Icon(
      (group.icon as Icon).icon,
      color: groupIconColors['icon'],
      size: (group.icon as Icon).size ?? 18,
    )
        : group.icon;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: groupColors['color'],
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
                    color: groupIconColors['color'],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:themedIcon
              ),
            ],
          ),
          const SizedBox(height: 8),

          Text(
            projectEntity.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: projectEntity.tasks.length / 100,
              minHeight: 10,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(
                  groupColors['processColor'] ?? Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}