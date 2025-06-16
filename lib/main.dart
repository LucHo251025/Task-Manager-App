import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/domain/entities/task_group_entity.dart';
import 'package:task_manager_app/features/task/presentation/widgets/task_group_card.dart';

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
          body: Center(
              child: TaskGroupCard(
                  group: TaskGroupEntity(
            id: '1',
            name: 'Office Project',
            totalTasks: 20,
            completedTasks: 14,
            icon: 'assets/icons/office.png',
          )))),
    );
  }
}
