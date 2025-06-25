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
      case 'Daily Study':
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

    final groupColors = getColorIconByGroupName(selected.name);
    Icon themedIcon = selected.icon is Icon
        ? Icon(
      (selected.icon as Icon).icon,
      color: groupColors['icon'],
      size: (selected.icon as Icon).size ?? 23,
    )
        : selected.icon;
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
                          color: groupColors['color'],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: themedIcon),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Task Group",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600])),
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
            margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 2),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.outline,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
              border: Border.all(
                color: theme.colorScheme.outline,
                width: 1.5
              )

            ),
            child:  Column(
              children: widget.groups
                  .where((g) => g.id != selected.id)
                  .map((group) {
                final groupColors = getColorIconByGroupName(group.name); // 👈 lấy đúng màu theo tên group
                final themedIcon = group.icon is Icon
                    ? Icon(
                  (group.icon as Icon).icon,
                  color: groupColors['icon'], // 👈 màu icon
                  size: (group.icon as Icon).size ?? 23,
                )
                    : group.icon;

                return ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: groupColors['color'], // 👈 màu nền nhạt
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: themedIcon,
                  ),
                  title: Text(
                    group.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: theme.colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => _selectGroup(group),
                );
              })
                  .toList(),

            ),
          )
      ],
    );
  }
}
