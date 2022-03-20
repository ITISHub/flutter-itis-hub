import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itis_hub/data/repository/course_repository_impl.dart';
import 'package:itis_hub/ui/widgets/itis_hub_bar.dart';

import '../../domain/repository/course_repository.dart';
import '../widgets/developer_card.dart';

class CoursesScreen extends StatelessWidget {
  final CourseRepository courseRepository = CourseRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    var courses = courseRepository.getAllCourses();
    return Column(children: [
      ItisHubBar("Курсы"),
      Expanded(
          child: ListView.builder(
              primary: false,
              itemCount: courses.length,
              itemBuilder: (_, i) {
                return Container(
                    height: 94.0,
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Center(
                        child: SubjectCard(
                            courses[i].title, courses[i].route, () {
                      Navigator.pushNamed(context, courses[i].route);
                    })));
              }))
    ]);
  }
}
