import 'package:clean_note_app/features/delete_update_note/data/dto/request/update_note_request.dart';
import 'package:clean_note_app/features/delete_update_note/data/dto/response/update_note_response.dart';

abstract interface class IupdateNoteRepository {
  Future<UpdateNoteResponse> updateNote(UpdateNoteRequest request);
}