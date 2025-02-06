import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/delete_update_note/application/services/delete/idelete_note_service.dart';
import 'package:clean_note_app/features/delete_update_note/data/repository/delete/delete_note_repository.dart';
import 'package:clean_note_app/features/delete_update_note/data/repository/delete/idelete_note_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final deleteNoteServiceProvider = Provider.autoDispose<IdeleteNoteService>((ref) {
  final repository = ref.watch(deleteNoteRepositoryProvider);

  return DeleteNoteService(repository);
});

final class DeleteNoteService implements IdeleteNoteService {
  final IdeleteNoteRepository _deleteNoteRepository;

  DeleteNoteService(this._deleteNoteRepository);

  @override
  Future<Result<bool, Failure>> deleteNote(int id) async {
    try {
      await _deleteNoteRepository.deleteNote(id);

      return Success(true);
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
