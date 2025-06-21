import 'package:flutter/material.dart';
import '../../domain/entities/task_group_entity.dart';

class SelectedTaskGroupCard extends StatefulWidget {
  final List<TaskGroupEntity> groups;
  final ValueChanged<TaskGroupEntity>? onGroupSelected;

  const SelectedTaskGroupCard({
    super.key,
    required this.groups,
    this.onGroupSelected,
  });

  @override
  State<StatefulWidget> createState() => _SelectedTaskGroupCardState();
}

class _SelectedTaskGroupCardState extends State<SelectedTaskGroupCard> {
  late TaskGroupEntity selected = widget.groups.first;
  bool isExpanded = false;


  @override
  void initState() {
    super.initState();
    selected = widget.groups.first;
  }

  void _selectGroup(TaskGroupEntity group) {
    setState(() {
      selected = group;
      isExpanded = false;
    });
    widget.onGroupSelected?.call(group);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Container(
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.outline,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: Theme.of(context).colorScheme.outline, // màu viền
                width: 1.5, // độ dày viền
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: selected.iconColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: selected.icon),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Task Group",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600])),
                        Text(selected.name,
                            style: TextStyle(
                              color: theme.colorScheme.onSecondary,
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
                Icon(
                  isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],

            ),
            child:  Column(
              children: widget.groups
                  .where((g) => g != selected)
                  .map((group) => ListTile(
                        leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: group.iconColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: group.icon),
                        title: Text(group.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        onTap: () => _selectGroup(group),
                      ))
                  .toList(),

            ),
          )
      ],
    );
  }
}
