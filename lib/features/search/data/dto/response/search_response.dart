import 'package:clean_note_app/common/models/note_model.dart';

class SearchResponse {
  final bool status;
  final String message;
  final List<NoteModel> notes;

  SearchResponse({
    required this.status,
    required this.message,
    required this.notes,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      status: json['status'],
      message: json['msg'],
      notes: (json['notes'] as List).map((e) => NoteModel.fromJson(e)).toList(),
    );
  }
}
