class NoteModel {
  final int id;
  final String title;
  final String content;
  final String createdAt;
  final String updatedAt;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  String toString() {
    return 'NoteModel{id: $id, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt}';
  } 
}
