import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/models/note_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IsearchService {
  Future<Result<List<NoteModel>,Failure>> search(String query);
}
