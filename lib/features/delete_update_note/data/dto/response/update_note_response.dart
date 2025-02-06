import 'package:clean_note_app/common/models/note_model.dart';

class UpdateNoteResponse {
  final bool status;
  final String message;
  final NoteModel note;

  UpdateNoteResponse({
    required this.status,
    required this.message,
    required this.note,
  });

  factory UpdateNoteResponse.fromJson(Map<String, dynamic> json) {
    return UpdateNoteResponse(
      status: json['status'],
      message: json['msg'],
      note: NoteModel.fromJson(json['note']),
    );
  }
}
