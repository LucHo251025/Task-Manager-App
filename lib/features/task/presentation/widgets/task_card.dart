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
        backgroundColor = Colors.grey.shade200;
        textColor = Colors.grey.shade800;
        label = "To-do";
        break;
      case TaskStatus.isProcess:
        backgroundColor = Colors.blue.shade100;
        textColor = Colors.blue.shade800;
        label = "In Progress";
        break;
      case TaskStatus.done:
        backgroundColor = Colors.deepPurple.shade100;
        textColor = Colors.deepPurple.shade800;
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
                            fontSize: 10,
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
