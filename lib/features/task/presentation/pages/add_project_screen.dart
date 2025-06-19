import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/domain/entities/task_group_entity.dart';
import 'package:task_manager_app/features/task/presentation/widgets/select_date.dart';
import 'package:task_manager_app/features/task/presentation/widgets/task_group_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_manager_app/features/task/presentation/widgets/reusable_button.dart';
import 'package:task_manager_app/features/task/presentation/widgets/date_card.dart';
import 'package:task_manager_app/features/task/presentation/widgets/custom_textfield.dart';
import 'package:task_manager_app/features/task/presentation/widgets/selected_task_group_card.dart';
import 'package:task_manager_app/features/task/presentation/widgets/description_textfield.dart';
import 'package:task_manager_app/features/task/presentation/widgets/select_date.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  void _onSubmit() {

  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:  Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Add Task",
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 23,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: _onSubmit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SelectedTaskGroupCard(groups: [
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
                icon: const Icon(
                  Icons.book,
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
            ]),
            SizedBox(
              height: 20,
            ),
            CustomTextField(),
            SizedBox(
              height: 20,
            ),
            DescriptionTextField(),
            SizedBox(
              height: 20,
            ),
            SelectDate(
              lable: "Start Date",
                initialDate: _startDate, onDateSelected: (date) {
              setState(() {
                _startDate = date;
              });
            }),
            SizedBox(
              height: 20,
            ),
            SelectDate(
                lable: "End Date",
                initialDate: _endDate, onDateSelected: (date) {
              setState(() {
                _endDate = date;
              });
            }),

            SizedBox(
              height: 80,
            ),
            ReusableButton(
              text: "Add Task",
              onPressed: _onSubmit,
            )
            ],
        )
      ),
    )
    );
  }
}