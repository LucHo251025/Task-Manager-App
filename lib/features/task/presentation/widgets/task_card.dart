import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/domain/entities/task_entity.dart';
import 'package:task_manager_app/features/task/domain/entities/task_group_entity.dart';

enum TaskStatus { todo, isProcess, done }

class TaskCard extends StatefulWidget {
  final TaskEntity task;
  final TaskGroupEntity group;

  const TaskCard({
    super.key,
    required this.task,
    required this.group,
  });

  @override
  State<StatefulWidget> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  TaskStatus status = TaskStatus.todo;

  void _nextStatus() {
    setState(() {
      switch (status) {
        case TaskStatus.todo:
          status = TaskStatus.isProcess;
          break;
        case TaskStatus.isProcess:
          status = TaskStatus.done;
          break;
        case TaskStatus.done:
          status = TaskStatus.todo;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color backgroundColor;
    Color textColor;
    String label;

    switch (status) {
      case TaskStatus.todo:
        backgroundColor = Color(0xFFE1F3FF);
        textColor = Color(0xFF0094FF);
        label = "To-do";
        break;
      case TaskStatus.isProcess:
        backgroundColor = Color(0xFFFFE9E0);
        textColor = Color(0xFFFF6B1D);
        label = "In Progress";
        break;
      case TaskStatus.done:
        backgroundColor = Color(0xFFF0EFFF);
        textColor = Color(0xFF8A59FF);
        label = "Done";
        break;
    }
    return Card(
        color: theme.colorScheme.surface,
        margin: EdgeInsets.all(2),
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.group.name,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.task.title,
                      style: TextStyle(
                        color: theme.colorScheme.onSecondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${widget.task.startDate.day}/${widget.task.startDate.month}/${widget.task.startDate.year}-${widget.task.endDate.day}/${widget.task.endDate.month}/${widget.task.endDate.year}",
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: widget.group.iconColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: widget.group.icon),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: _nextStatus,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: 13,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
