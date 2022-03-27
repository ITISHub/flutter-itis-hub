import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:itis_hub/data/api.dart';
import 'package:itis_hub/domain/models/lesson.dart';
import 'package:itis_hub/ui/theme/colors.dart';
import 'package:itis_hub/ui/theme/type.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../widgets/itis_hub_bar.dart';

class LessonScreen extends StatefulWidget {
  final Lesson lesson;

  LessonScreen({required this.lesson});

  @override
  State<StatefulWidget> createState() => LessonScreenState(lesson: lesson);
}

class LessonScreenState extends State<LessonScreen> {
  final apiClient = ApiClient();
  final Lesson lesson;

  LessonScreenState({required this.lesson});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller =
        YoutubePlayerController(initialVideoId: lesson.getVideoId());
    return Scaffold(
      backgroundColor: colorBackground,
      body: Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 56.0),
          child: Column(children: [
            ItisHubBar(
              "Урок",
              onBack: () => Navigator.pop(context),
              onAction: () {},
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Text(lesson.title,
                      style: textTitle, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  YoutubePlayerIFrame(
                    controller: _controller,
                    aspectRatio: 16 / 9,
                  ),
                  const SizedBox(height: 32),
                  Html(data: lesson.description, style: {
                    "*": Style(fontSize: FontSize(17.0), color: Colors.white)
                  })
                ],
              ),
            ))
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!await launch(lesson.pdfUrl)) throw 'Could not launch conspectus';
        },
        backgroundColor: colorSurface,
        child: const Icon(Icons.description),
      ),
    );
  }
}
