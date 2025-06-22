import 'package:flutter/material.dart';

class StatusTabBar extends StatefulWidget {
  final Function(int index) onTabSelected;

  const StatusTabBar({
    Key? key,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatusTabBarState();
}

class _StatusTabBarState extends State<StatusTabBar> {
  final List<String> tabs = ['All', 'To do', 'In Progress', 'Completed'];
  String selectedTab = 'All';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: tabs.map((tab) {
          final isSelected = tab == selectedTab ;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = tab;
              });
              widget.onTabSelected(tabs.indexOf(tab));
            },
            child:Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF6B3EFF) : const Color(0xFFF0EFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                tab,
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF6B3EFF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );

  }
}