class UpdateNoteRequest {
  final int id;
  final String title;
  final String noteContent;

  UpdateNoteRequest(
      {required this.id, required this.title, required this.noteContent});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'note_content': noteContent,
    };
  }

  factory UpdateNoteRequest.fromJson(Map<String, dynamic> json) {
    return UpdateNoteRequest(
      id: json['id'],
      title: json['title'],
      noteContent: json['note_content'],
    );
  }
}
