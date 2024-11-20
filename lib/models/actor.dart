class Actor {
  final int id;
  final String name;
  final String character;

  Actor({required this.id, required this.name, required this.character});

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['id'],
      name: json['name'],
      character: json['character'],
    );
  }
}
