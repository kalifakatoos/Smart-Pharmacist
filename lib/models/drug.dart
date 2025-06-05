class Drug {
  final String name;
  final String description;

  Drug({required this.name, required this.description});

  factory Drug.fromMap(Map<String, dynamic> map) {
    return Drug(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'description': description,
      };
}
