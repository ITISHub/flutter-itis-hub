import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:itis_hub/domain/models/developer.dart';
import 'package:itis_hub/domain/models/lesson.dart';

class ApiClient {

  static const host = "https://itishub.pythonanywhere.com/";

  Future<List<Lesson>> fetchLessons(int courseId) async {
    try {
      final response = await http.get(Uri.parse(
          'https://itishub.pythonanywhere.com/api/v1/courses/$courseId/'));
      var responseJson = json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        final result = (responseJson['lessons'] as List)
            .map((e) => Lesson.fromJson(e))
            .toList();
        return result;
      } else {
        throw Exception('Failed to load lessons');
      }
    } catch (exception) {
      print(exception);
      throw exception;
    }
  }

  Future<List<Developer>> fetchDevelopers() async {
    try {
      final response = await http
          .get(Uri.parse('https://itishub.pythonanywhere.com/api/v1/creators'));
      var responseJson = json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        final result = (responseJson as List)
            .map((e) => Developer.fromJson(e))
            .toList();
        return result;
      } else {
        throw Exception('Failed to load lessons');
      }
    } catch (exception) {
      print(exception);
      throw exception;
    }
  }

// Future<Lesson> fetchLesson(int courseId,int lessonId) {
//   final response = await http.get(Uri.parse(
//       'https://itishub.pythonanywhere.com/api/v1/courses/$courseId/$lessonId/'));
// }
}
