import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/domain/entities/task_group_entity.dart';
import 'package:task_manager_app/features/task/presentation/pages/add_task_screen.dart';
import 'package:task_manager_app/features/task/presentation/widgets/select_date.dart';
import 'package:task_manager_app/features/task/presentation/widgets/task_group_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_manager_app/features/task/presentation/widgets/reusable_button.dart';
import 'package:task_manager_app/features/task/presentation/widgets/date_card.dart';
import 'package:task_manager_app/features/task/presentation/widgets/custom_textfield.dart';
import 'package:task_manager_app/features/task/presentation/widgets/selected_task_group_card.dart';
import 'package:task_manager_app/features/task/presentation/widgets/description_textfield.dart';
import 'package:task_manager_app/features/task/presentation/widgets/selected_task_group_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          backgroundColor: Colors.white, // hoặc màu khác bạn muốn
          body: const AddTaskScreen(),
      )
    );
  }
}
