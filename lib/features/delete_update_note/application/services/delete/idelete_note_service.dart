import 'package:clean_note_app/common/exception/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IdeleteNoteService {
  Future<Result<bool, Failure>> deleteNote(int id);
}