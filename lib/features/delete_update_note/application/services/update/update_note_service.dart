import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/models/note_model.dart';
import 'package:clean_note_app/features/delete_update_note/application/services/update/iupdate_note_service.dart';
import 'package:clean_note_app/features/delete_update_note/data/dto/request/update_note_request.dart';
import 'package:clean_note_app/features/delete_update_note/data/repository/update/iupdate_note_repository.dart';
import 'package:clean_note_app/features/delete_update_note/data/repository/update/update_note_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final updateNoteServiceProvider = Provider.autoDispose<IupdateNoteService>((ref) {
  final repository = ref.watch(updateNoteRepositoryProvider);

  return UpdateNoteService(repository);
});

final class UpdateNoteService implements IupdateNoteService {
  final IupdateNoteRepository _repository;

  UpdateNoteService(this._repository);
  
  @override
  Future<Result<NoteModel, Failure>> updateNote(
      UpdateNoteRequest request) async {
    try {
      final response = await _repository.updateNote(request);

      return Success(response.note);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      ));
    }
  }
}
