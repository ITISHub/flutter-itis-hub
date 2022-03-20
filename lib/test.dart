import 'package:itis_hub/data/api.dart';

Future<void> main() async {
  try {
   final api = ApiClient();
   final lessons = api.fetchLessons(3);
   print((await lessons).toString());
  } catch (error) {
    print(error);
  }
}