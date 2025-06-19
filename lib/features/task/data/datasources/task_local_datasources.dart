import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/data/models/project_model.dart';

import '../models/task_groud_model.dart';
import '../models/task_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskLocalDataSource {

  Future<List<TaskGroupModel>> getTaskGroups() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      TaskGroupModel(
        id: 'group1',
        name: 'Personal Tasks',
        projects: [
          ProjectModel(
            id: 'project1',
            name: 'Fitness App',
            description: 'Build a fitness tracking mobile app',
            startDate: DateTime(2025, 6, 1),
            endDate: DateTime(2025, 6, 30),
            groupId: 'group1',
            status: 'active',
            tasks: [
              TaskModel(
                id: 'task1',
                projectId: 'project1',
                title: 'Design UI',
                status: 'done',
                startDate: DateTime(2025, 6, 2),
                endDate: DateTime(2025, 6, 4),
              ),
              TaskModel(
                id: 'task2',
                projectId: 'project1',
                title: 'Implement Backend',
                status: 'pending',
                startDate: DateTime(2025, 6, 2),
                endDate: DateTime(2025, 6, 4),
              ),
            ],
          ),
        ],
        icon: const Icon(FontAwesomeIcons.user, size: 30, color: Colors.blue),
        iconColor: Colors.blue,
      ),
      TaskGroupModel(
        id: 'group2',
        name: 'Work Projects',
        projects: [
          ProjectModel(
            id: 'project2',
            name: 'Company Website',
            description: 'Redesign the landing page and improve SEO',
            startDate: DateTime(2025, 5, 10),
            endDate: DateTime(2025, 6, 20),
            groupId: 'group2',
            status: 'active',
            tasks: [
              TaskModel(
                id: 'task3',
                projectId: 'project2',
                title: 'Write SEO content',
                status: 'in_progress',
                startDate: DateTime(2025, 6, 2),
                endDate: DateTime(2025, 6, 4),
              ),
              TaskModel(
                id: 'task4',
                projectId: 'project2',
                title: 'Deploy to production',
                status: 'pending',
                startDate: DateTime(2025, 6, 2),
                endDate: DateTime(2025, 6, 4),
              ),
            ],
          ),
        ],
        icon: const Icon(FontAwesomeIcons.briefcase, size: 30, color: Colors.green),
        iconColor: Colors.green,
      ),
    ];
  }

  // Future<TaskModel> getTaskGroupById(String id) async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //
  // }
}