import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/create_note/data/dto/request/create_note_request.dart';
import 'package:clean_note_app/features/create_note/data/dto/response/create_note_response.dart';
import 'package:clean_note_app/features/create_note/data/repository/icreate_note_repository.dart';
import 'package:clean_note_app/features/create_note/data/source/remote/create_note_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createNoteRepositoryProvider = Provider<ICreateNoteRepository>((ref) {
  final createNoteApi = ref.watch(createNoteApiProvider);

  return CreateNoteRepository(createNoteApi);
});

final class CreateNoteRepository
    with DioExceptionMapper
    implements ICreateNoteRepository {
  final CreateNoteApi _createNoteApi;

  CreateNoteRepository(this._createNoteApi);

  @override
  Future<CreateNoteResponse> createNote(CreateNoteRequest request) async {
    try {
      return await _createNoteApi.createNote(request);
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
