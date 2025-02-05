class CreateNoteResponse {
  final bool status;
  final String message;
  final Note note;

  CreateNoteResponse({
    required this.status,
    required this.message,
    required this.note,
  });

  factory CreateNoteResponse.fromJson(Map<String, dynamic> json) {
    return CreateNoteResponse(
      status: json['status'],
      message: json['msg'],
      note: Note.fromJson(json['note']),
    );
  }
}

class Note {
  final int id;
  final String title;
  final String content;
  final String createdAt;
  final String updatedAt;

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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
