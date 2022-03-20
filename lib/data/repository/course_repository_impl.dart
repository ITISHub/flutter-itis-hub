import 'package:itis_hub/domain/models/course.dart';
import 'package:itis_hub/domain/repository/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final List<Course> _courses = [
    Course(id: 1, title: "Матан", route: "/matan"),
    Course(id: 2, title: "Дискретка", route: "/diskra"),
    Course(id: 3, title: "Алгем", route: "/algem")
  ];

  @override
  List<Course> getAllCourses() => _courses;
}
