import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/delete_update_note/data/dto/request/update_note_request.dart';
import 'package:clean_note_app/features/delete_update_note/data/dto/response/update_note_response.dart';
import 'package:clean_note_app/features/delete_update_note/data/repository/update/iupdate_note_repository.dart';
import 'package:clean_note_app/features/delete_update_note/data/source/remote/update_note_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateNoteRepositoryProvider = Provider.autoDispose<IupdateNoteRepository>((ref) {
  final updateNoteApi = ref.watch(updateNoteApiProvider);

  return UpdateNoteRepository(updateNoteApi);
});

final class UpdateNoteRepository
    with DioExceptionMapper
    implements IupdateNoteRepository {
  final UpdateNoteApi _updateNoteApi;

  UpdateNoteRepository(this._updateNoteApi);

  @override
  Future<UpdateNoteResponse> updateNote(UpdateNoteRequest request)async {
    try {
      return await _updateNoteApi.updateNote(request);
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
