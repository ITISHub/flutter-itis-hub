import 'package:itis_hub/domain/models/course.dart';

abstract class CourseRepository {
  List<Course> getAllCourses();
}
