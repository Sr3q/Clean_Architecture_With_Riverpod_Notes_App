import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/create_note/data/dto/request/create_note_request.dart';
import 'package:clean_note_app/features/home/application/models/note_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class ICreateNoteService {
  Future<Result<NoteModel, Failure>> createNote(CreateNoteRequest request);
}