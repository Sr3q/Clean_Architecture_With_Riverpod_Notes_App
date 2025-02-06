class CreateNoteRequest {
  final String title;
  final String noteContent;

  CreateNoteRequest({required this.title, required this.noteContent});

  Map<String, dynamic> tojson() {
    return {
      'title': title,
      'note_content': noteContent,
    };
  }

  factory CreateNoteRequest.fromJson(Map<String, dynamic> json) {
    return CreateNoteRequest(
      title: json['title'],
      noteContent: json['note_content'],
    );
  }
}
