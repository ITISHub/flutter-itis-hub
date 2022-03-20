class Lesson {
  final int id;
  final String title;
  final String description;
  final String videoUrl;
  final String pdfUrl;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.pdfUrl
  });


  @override
  String toString() {
    return '{"id": $id, "title": "$title", "description": "$description", "video_url": "$videoUrl", "pdf_url": "$pdfUrl"}';
  }

  String getVideoId() => videoUrl.split("embed/").last;

  factory Lesson.fromJson(Map<String,dynamic> json) {
    return Lesson(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        videoUrl: json['video_url'],
        pdfUrl: json['pdf_file']
    );
  }
}

// factory Lesson.fromJson(Map<String,dynamic> json) => _$LessonFromJson;
// Map<String,dynamic> json => _$LessonFromJson(this);

