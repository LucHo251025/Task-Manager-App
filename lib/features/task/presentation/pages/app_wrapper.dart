import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/presentation/pages/add_project_screen.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return
      Scaffold(
        backgroundColor: Colors.transparent,
        body: AddProjectScreen(),
      );
  }
}
