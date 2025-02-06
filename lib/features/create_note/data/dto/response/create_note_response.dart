import 'package:clean_note_app/common/models/note_model.dart';

class CreateNoteResponse {
  final bool status;
  final String message;
  final NoteModel note;

  CreateNoteResponse({
    required this.status,
    required this.message,
    required this.note,
  });

  factory CreateNoteResponse.fromJson(Map<String, dynamic> json) {
    return CreateNoteResponse(
      status: json['status'],
      message: json['msg'],
      note: NoteModel.fromJson(json['note']),
    );
  }
}
