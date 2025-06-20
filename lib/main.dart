import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/domain/entities/task_group_entity.dart';
import 'package:task_manager_app/features/task/presentation/pages/add_project_screen.dart';
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
final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF7A3FFF),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
      seedColor: Colors.deepPurple
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 18,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 14,
      color: Colors.black54,
    ),

    bodyLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.black87,
    ),

  ),
  useMaterial3: true,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF7A3FFF),
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
    brightness: Brightness.dark,

  ),
  textTheme:
  TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 18,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 14,
      color: Colors.white70,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
  useMaterial3: true,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Color(0xFFF8F5FF),
                  Color(0xFFFFF7E9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent, // hoặc màu khác bạn muốn
              body: const AddProjectScreen(),
            )));
  }
}
