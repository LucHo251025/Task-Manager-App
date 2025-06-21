import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/domain/entities/task_group_entity.dart';

class TaskGroupCard extends StatelessWidget {
  final TaskGroupEntity group;

  TaskGroupCard({required this.group});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final totalProject = group.projects.length;
    final completedProject = group.projects.where((project) => project.status == 'done').length;
    final percentage = totalProject > 0 ? completedProject / totalProject : 0.0;

    return Card(
      color: theme.colorScheme.surface,
      margin: EdgeInsets.all(2),
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: group.iconColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: group.icon
            ),

            SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                ],
              ),
            ),

            SizedBox(width: 16),

            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: percentage,
                    strokeWidth: 5,
                    backgroundColor: Color(0xFFFDE6F0), // Màu nền của vòng tròn
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFED77B4)),
                  ),
                ),
                Text(
                  '${(percentage * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    color: theme.colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


