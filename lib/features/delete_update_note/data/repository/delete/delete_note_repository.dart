import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/delete_update_note/data/repository/delete/idelete_note_repository.dart';
import 'package:clean_note_app/features/delete_update_note/data/source/remote/delete_note_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteNoteRepositoryProvider = Provider.autoDispose<IdeleteNoteRepository>((ref) {
  final deleteNoteApi = ref.watch(deleteNoteApiProvider);

  return DeleteNoteRepository(deleteNoteApi);
});

final class DeleteNoteRepository
    with DioExceptionMapper
    implements IdeleteNoteRepository {
  final DeleteNoteApi _deleteNoteApi;

  DeleteNoteRepository(this._deleteNoteApi);

  @override
  Future<void> deleteNote(int id) async {
    try {
      await _deleteNoteApi.deleteNote(id);
    } on DioException catch (e, s) {
      throw mapDioExceptionToFailure(e, s);
    } catch (e, s) {
      throw Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}
