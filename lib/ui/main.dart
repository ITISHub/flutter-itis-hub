import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itis_hub/data/repository/course_repository_impl.dart';
import 'package:itis_hub/ui/screens/course_screen.dart';
import 'package:itis_hub/ui/screens/lesson_screen.dart';
import 'package:itis_hub/ui/screens/main_screen.dart';

import '../data/repository/lessons_repository.dart';
import '../domain/models/lesson.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final courses = CourseRepositoryImpl().getAllCourses();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/': (BuildContext context) => MainScreen(),
          '/matan': (BuildContext context) => CourseScreen(course: courses[0]),
          '/diskra': (BuildContext context) => CourseScreen(course: courses[1]),
          '/algem': (BuildContext context) => CourseScreen(course: courses[2]),
        },
        onGenerateRoute: (routeSettings) {
          var path = routeSettings.name?.split('/');
          if (path?[1] == "lesson") {
            final lessonId = int.parse((path![2]));
            final lesson =
                lessons.firstWhere((element) => element.id == lessonId);
            return MaterialPageRoute(
              builder: (context) => LessonScreen(lesson: lesson),
              settings: routeSettings,
            );
          }
        },
        theme: ThemeData(
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)));
  }
}
