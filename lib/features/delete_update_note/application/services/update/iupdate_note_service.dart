import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/models/note_model.dart';
import 'package:clean_note_app/features/delete_update_note/data/dto/request/update_note_request.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IupdateNoteService{
  Future<Result<NoteModel, Failure>> updateNote(UpdateNoteRequest request);
}