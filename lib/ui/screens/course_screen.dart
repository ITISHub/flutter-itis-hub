import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itis_hub/data/api.dart';
import 'package:itis_hub/data/repository/lessons_repository.dart';
import 'package:itis_hub/domain/models/course.dart';
import 'package:itis_hub/domain/models/lesson.dart';
import 'package:itis_hub/ui/theme/colors.dart';

import '../widgets/developer_card.dart';
import '../widgets/itis_hub_bar.dart';

class CourseScreen extends StatefulWidget {
  final Course course;

  CourseScreen({required this.course});

  @override
  State<StatefulWidget> createState() => CourseScreenState(course: course);
}

class CourseScreenState extends State<CourseScreen> {
  final Course course;
  late Future<List<Lesson>> _futureLessons;
  final apiClient = ApiClient();

  CourseScreenState({required this.course});

  @override
  void initState() {
    super.initState();
    _futureLessons = apiClient.fetchLessons(course.id);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: colorBackground,
      body: Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 56.0),
          child: Column(children: [
            ItisHubBar(
              course.title,
              onBack: () => Navigator.pop(context),
              onAction: () {},
            ),
            Expanded(
                child: FutureBuilder(
              future: _futureLessons,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data as List<Lesson>;
                  lessons = snap;
                  return ListView.builder(
                      primary: false,
                      itemCount: snap.length,
                      itemBuilder: (_, i) {
                        return Container(
                            height: 94.0,
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: Center(
                                child: SubjectCard(snap[i].title, snap[i].title,
                                    () {
                              Navigator.pushNamed(
                                  context, "/lesson/" + snap[i].id.toString());
                            })));
                      });
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Error!"));
                }
                return const Center(child: CircularProgressIndicator());
              },
            ))
          ])));
}
