import 'package:clean_note_app/features/create_note/data/dto/request/create_note_request.dart';
import 'package:clean_note_app/features/create_note/data/dto/response/create_note_response.dart';

abstract interface class ICreateNoteRepository {
  Future<CreateNoteResponse> createNote(CreateNoteRequest request);
}