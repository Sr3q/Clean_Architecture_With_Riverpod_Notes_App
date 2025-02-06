import 'package:clean_note_app/common/models/note_model.dart';

class GetNotesRespnse {
  final bool status;
  final String message;
  final List<NoteModel> notes;

  GetNotesRespnse({
    required this.status,
    required this.message,
    required this.notes,
  });

  factory GetNotesRespnse.fromjson(Map<String, dynamic> json) {
    return GetNotesRespnse(
      status: json['status'],
      message: json['msg'],
      notes: List<NoteModel>.from(json['notes'].map((x) => NoteModel.fromJson(x))),
    );
  }
}