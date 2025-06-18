import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/domain/entities/task_group_entity.dart';
import 'package:task_manager_app/features/task/presentation/widgets/task_group_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_manager_app/features/task/presentation/widgets/reusable_button.dart';
import 'package:task_manager_app/features/task/presentation/widgets/date_card.dart';
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
          body: Center(
              child: Column(
            children: [
              TaskGroupCard(
                  group: TaskGroupEntity(
                id: '1',
                name: 'Office Project',
                totalTasks: 20,
                completedTasks: 14,
                icon: Icon(Icons.padding_rounded),
                iconColor: Colors.pink,
              )),
              ReusableButton(
                  text: "Click Me",
                  onPressed: () {
                    print("Button Pressed");
                  },
                  icon: Icons.check),
              SizedBox(
                height: 30,
              ),
              DateCard(
                date: DateTime(2025, 5, 25),
                isSelected: false,
                onTap: () {
                  print("Ngày được chọn!");
                },
              ),
              SizedBox(
                height: 20,
              ),
              SelectedTaskGroupCard(
                groups: [
                  TaskGroupEntity(
                    id: '1',
                    name: 'Work',
                    totalTasks: 10,
                    completedTasks: 6,
                    icon: const Icon(
                      Icons.work,
                      color: Color(0xFFED77B4),
                      size: 28,
                    ),
                    iconColor: Color(0xFFFDE6F0),
                  ),
                  TaskGroupEntity(
                    id: '2',
                    name: 'Study',
                    totalTasks: 5,
                    completedTasks: 3,
                    icon: const Icon(Icons.book,

                    ),
                    iconColor: Colors.green,
                  ),
                  TaskGroupEntity(
                    id: '3',
                    name: 'Personal',
                    totalTasks: 7,
                    completedTasks: 4,
                    icon: const Icon(Icons.person),
                    iconColor: Colors.blue,
                  ),
                ],
                onGroupSelected: (group) {
                  print("Selected group: ${group.name}");
                },
              )
            ],
          ))),
    );
  }
}
