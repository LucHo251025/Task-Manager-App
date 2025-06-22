import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/presentation/pages/add_project_screen.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 6,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white,size: 40),
        ),
        extendBody: true  ,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            elevation: 10,
            color: Colors.deepPurple.shade50.withOpacity(0.95),
            child: _buildBottomBar(),
          ),
        ),

        backgroundColor: Colors.transparent,
        body: AddProjectScreen(),
      );
  }
}
Widget _buildBottomBar() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildNavIcon(Icons.home,
        ),
        _buildNavIcon(Icons.calendar_today),
        const SizedBox(width: 48), // chừa chỗ cho nút +
        _buildNavIcon(Icons.description),
        _buildNavIcon(Icons.group),
      ],
  );
}

Widget _buildNavIcon(IconData iconData) {
  return IconButton(
    onPressed: () {},
    icon: Icon(iconData, color: Colors.deepPurple.shade300,size: 25),
  );
}
