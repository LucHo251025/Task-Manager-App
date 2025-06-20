import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/presentation/pages/add_project_screen.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
            const Color(0xFF1F1F1F),
            const Color(0xFF121212),
            const Color(0xFF0D0D0D),
          ]
              : [
            Colors.white,
            const Color(0xFFF8F5FF),
            const Color(0xFFFFF7E9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: AddProjectScreen(),
      ),
    );
  }
}
