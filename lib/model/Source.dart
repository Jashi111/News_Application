class Source {
  String id;
  String name;
  String category;

  Source({required this.id, required this.name, required this.category});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String? ?? 'default_id',
      name: json['name'] as String? ?? 'default_name',
      category: json['category'] as String? ?? 'default_category',
    );
  }
}