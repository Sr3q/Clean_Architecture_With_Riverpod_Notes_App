class GetNotesRespnse {
  final bool status;
  final String message;
  final List<Note> notes;

  GetNotesRespnse({
    required this.status,
    required this.message,
    required this.notes,
  });

  factory GetNotesRespnse.fromjson(Map<String, dynamic> json) {
    return GetNotesRespnse(
      status: json['status'],
      message: json['msg'],
      notes: List<Note>.from(json['notes'].map((x) => Note.fromJson(x))),
    );
  }
}

class Note {
  final int id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
