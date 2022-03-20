class Developer {
  final int id;
  final String name;
  final String surname;
  final String avatarPath;
  final String about;
  final String telegramUrl;
  final String githubUrl;
  final String vkUrl;

  Developer({
    required this.id,
    required this.name,
    required this.surname,
    required this.avatarPath,
    required this.about,
    required this.telegramUrl,
    required this.githubUrl,
    required this.vkUrl});

  factory Developer.fromJson(Map<String,dynamic> json) {
    return Developer(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      avatarPath: json['avatar'],
      about: json['about'],
      telegramUrl: json['telegram'],
      githubUrl: json['github'],
      vkUrl: json['vk']
    );
  }
}
