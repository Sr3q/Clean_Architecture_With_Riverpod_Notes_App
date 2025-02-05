class CreateNoteRequest {
  final String title;
  final String noteContent;

  CreateNoteRequest({required this.title, required this.noteContent});

  Map<String, dynamic> tojson() {
    return {
      'title': title,
      'note_Content': noteContent,
    };
  }
}
