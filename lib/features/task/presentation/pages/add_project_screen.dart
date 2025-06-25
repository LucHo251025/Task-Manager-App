import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/domain/entities/project_entity.dart';
import 'package:task_manager_app/features/task/domain/entities/task_entity.dart';
import 'package:task_manager_app/features/task/domain/entities/task_group_entity.dart';
import 'package:task_manager_app/features/task/presentation/widgets/horizontal_date_picker.dart';
import 'package:task_manager_app/features/task/presentation/widgets/horizontal_project_card_process.dart';
import 'package:task_manager_app/features/task/presentation/widgets/project_card_process.dart';
import 'package:task_manager_app/features/task/presentation/widgets/select_date.dart';
import 'package:task_manager_app/features/task/presentation/widgets/status_tabbar.dart';
import 'package:task_manager_app/features/task/presentation/widgets/task_card.dart';
import 'package:task_manager_app/features/task/presentation/widgets/task_group_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_manager_app/features/task/presentation/widgets/reusable_button.dart';
import 'package:task_manager_app/features/task/presentation/widgets/date_card.dart';
import 'package:task_manager_app/features/task/presentation/widgets/custom_textfield.dart';
import 'package:task_manager_app/features/task/presentation/widgets/selected_task_group_card.dart';
import 'package:task_manager_app/features/task/presentation/widgets/description_textfield.dart';
import 'package:task_manager_app/features/task/presentation/widgets/select_date.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  void _onSubmit() {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
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
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: colors.onSecondary,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              "Add Project",
              style: theme.textTheme.titleMedium,
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
                  HorizontalProjectList(groupList: [
                    TaskGroupEntity(
                      id: '1',
                      name: 'Office Project',
                      projects: [
                        ProjectEntity(
                          id: 'p1',
                          groupId: '1',
                          description: 'Work-related projects and tasks',
                          name: 'Project Alpha',
                          tasks: [
                            TaskEntity(
                              id: "1",
                              projectId: "1",
                              title: "Design Mockup",
                              status: "isProcess",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 2)),
                            ),
                            TaskEntity(
                              id: "2",
                              projectId: "1",
                              title: "Develop Backend",
                              status: "isProcess",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 3)),
                            )
                          ],
                          status: 'isProcess',
                          startDate: DateTime.now(),
                          endDate: DateTime.now().add(Duration(days: 5)),
                        ),
                        ProjectEntity(
                          id: 'p1',
                          groupId: '1',
                          description: 'Work-related projects and tasks',
                          name: 'Project Alpha',
                          tasks: [
                            TaskEntity(
                              id: "1",
                              projectId: "1",
                              title: "Design Mockup",
                              status: "isProcess",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 2)),
                            ),
                            TaskEntity(
                              id: "2",
                              projectId: "1",
                              title: "Develop Backend",
                              status: "isProcess",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 3)),
                            )
                          ],
                          status: 'isProcess',
                          startDate: DateTime.now(),
                          endDate: DateTime.now().add(Duration(days: 5)),
                        ),
                      ],
                      icon: Icon(
                        Icons.work,
                        color: Color(0xFF6C3BEF),
                      ),
                      iconColor: Colors.green,
                    ),
                    TaskGroupEntity(
                      id: '1',
                      name: 'Personal Project',
                      projects: [
                        ProjectEntity(
                          id: 'p1',
                          groupId: '1',
                          description: 'Work-related projects and tasks',
                          name: 'Project Alpha',
                          tasks: [
                            TaskEntity(
                              id: "1",
                              projectId: "1",
                              title: "Design Mockup",
                              status: "isProcess",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 2)),
                            ),
                            TaskEntity(
                              id: "2",
                              projectId: "1",
                              title: "Develop Backend",
                              status: "isProcess",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 3)),
                            )
                          ],
                          status: 'isProcess',
                          startDate: DateTime.now(),
                          endDate: DateTime.now().add(Duration(days: 5)),
                        ),
                      ],
                      icon: Icon(
                        Icons.work,
                        color: Color(0xFF6C3BEF),
                      ),
                      iconColor: Colors.green,
                    )
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  HorizontalDatePicker(
                    initialDate: DateTime.now(),
                    onDateSelected: (pickedDate) {
                      // Xử lý khi chọn ngày
                      print('Ngày được chọn: $pickedDate');
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  StatusTabBar(
                    onTabSelected: (tab) {
                      print('Selected: $tab');
                      // TODO: Filter task list based on tab
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TaskCard(
                    task: TaskEntity(
                      id: "1",
                      projectId: "1",
                      title: "Design Mockup",
                      status: "isProcesss",
                      startDate: DateTime.now(),
                      endDate: DateTime.now().add(Duration(days: 2)),
                    ),
                    group: TaskGroupEntity(
                      id: '1',
                      name: 'Work',
                      projects: [
                        ProjectEntity(
                          id: 'p1',
                          groupId: '1',
                          description: 'Work-related projects and tasks',
                          name: 'Project Alpha',
                          tasks: [
                            TaskEntity(
                              id: "1",
                              projectId: "1",
                              title: "Design Mockup",
                              status: "isProcesss",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 2)),
                            ),
                            TaskEntity(
                              id: "2",
                              projectId: "1",
                              title: "Develop Backend",
                              status: "isProcesss",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 3)),
                            )
                          ],
                          status: 'done',
                          startDate: DateTime.now(),
                          endDate: DateTime.now().add(Duration(days: 5)),
                        ),
                      ],
                      icon: Icon(
                        Icons.work,
                        color: Color(0xFF6C3BEF),
                      ),
                      iconColor: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SelectedTaskGroupCard(groups: [
                    TaskGroupEntity(
                      id: '3',
                      name: 'Personal',
                      projects: [
                        ProjectEntity(
                          id: 'p4',
                          groupId: '3',
                          description: 'Personal projects and hobbies',
                          name: 'Workout Plan',
                          tasks: [
                            TaskEntity(
                              id: "1",
                              projectId: "1",
                              title: "APP",
                              status: "isProcesss",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 1)),
                            ),
                            TaskEntity(
                              id: "1",
                              projectId: "1",
                              title: "APP",
                              status: "isProcesss",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 1)),
                            )
                          ],
                          status: 'done',
                          startDate: DateTime.now(),
                          endDate: DateTime.now().add(Duration(days: 1)),
                        ),
                      ],
                      icon: const Icon(Icons.person),
                      iconColor: Colors.blue,
                    ),
                    TaskGroupEntity(
                      id: '3',
                      name: 'Personal',
                      projects: [
                        ProjectEntity(
                          id: 'p4',
                          groupId: '3',
                          description: 'Personal projects and hobbies',
                          name: 'Workout Plan',
                          tasks: [
                            TaskEntity(
                              id: "1",
                              projectId: "1",
                              title: "APP",
                              status: "isProcesss",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 1)),
                            ),
                            TaskEntity(
                              id: "1",
                              projectId: "1",
                              title: "APP",
                              status: "isProcesss",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 1)),
                            )
                          ],
                          status: 'done',
                          startDate: DateTime.now(),
                          endDate: DateTime.now().add(Duration(days: 1)),
                        ),
                      ],
                      icon: const Icon(Icons.person),
                      iconColor: Colors.blue,
                    ),
                    TaskGroupEntity(
                      id: '3',
                      name: 'Personal',
                      projects: [
                        ProjectEntity(
                          id: 'p4',
                          groupId: '3',
                          description: 'Personal projects and hobbies',
                          name: 'Workout Plan',
                          tasks: [
                            TaskEntity(
                              id: "1",
                              projectId: "1",
                              title: "APP",
                              status: "isProcesss",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 1)),
                            ),
                            TaskEntity(
                              id: "1",
                              projectId: "1",
                              title: "APP",
                              status: "isProcesss",
                              startDate: DateTime.now(),
                              endDate: DateTime.now().add(Duration(days: 1)),
                            )
                          ],
                          status: 'done',
                          startDate: DateTime.now(),
                          endDate: DateTime.now().add(Duration(days: 1)),
                        ),
                      ],
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
                      initialDate: _startDate,
                      onDateSelected: (date) {
                        setState(() {
                          _startDate = date;
                        });
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  SelectDate(
                      lable: "End Date",
                      initialDate: _endDate,
                      onDateSelected: (date) {
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
              )),
        )));
  }
}
