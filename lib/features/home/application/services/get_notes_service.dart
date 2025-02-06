import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/models/note_model.dart';
import 'package:clean_note_app/features/home/application/services/iget_notes_service.dart';
import 'package:clean_note_app/features/home/data/repository/get_notes_repository.dart';
import 'package:clean_note_app/features/home/data/repository/iget_notes_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final getNotesServiceProvider = Provider.autoDispose<IGetNotesService>((ref) {
  final repository = ref.watch(getNotesRepositoryProvider);

  return GetNotesService(repository);
});

final class GetNotesService implements IGetNotesService {
  final IGetNotesRepository _repository;

  GetNotesService(this._repository);

  @override
  Future<Result<List<NoteModel>, Failure>> getNotes() async {
    try {
      final response = await _repository.getNotes();

      return Success(response.notes);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(
        Failure(
          message: e.toString(),
          exception: e as Exception,
          stackTrace: s,
        ),
      );
    }
  }
}
