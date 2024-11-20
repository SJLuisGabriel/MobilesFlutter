class Video {
  final String key;
  final String name;

  Video({required this.key, required this.name});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      key: json['key'],
      name: json['name'],
    );
  }
}
