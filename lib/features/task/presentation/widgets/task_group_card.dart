import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/domain/entities/task_group_entity.dart';

class TaskGroupCard extends StatelessWidget {
  final TaskGroupEntity group;

  TaskGroupCard({required this.group});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(12),
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
                color: Color(0xFFFDE6F0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.work_outline,
                color: Color(0xFFED77B4),
                size: 28,
              ),
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

            // buildPercentageCircle(group.completedTasks.toDouble(), group.totalTasks.toDouble()),

          ],
        ),
      ),
    );
  }
}

Widget buildPercentageCircle(double completed, double total) {
  double percentage = total > 0 ? (completed / total) : 0;

  return Stack(
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
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    ],
  );
}

