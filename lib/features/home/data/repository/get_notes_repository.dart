import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/home/data/dto/response/get_notes_respnse.dart';
import 'package:clean_note_app/features/home/data/repository/iget_notes_repository.dart';
import 'package:clean_note_app/features/home/data/source/remote/get_notes_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getNotesRepositoryProvider = Provider.autoDispose<IGetNotesRepository>((ref) {
  final getNotesApi = ref.watch(getNotesApiProvider);

  return GetNotesRepository(getNotesApi);
});

final class GetNotesRepository
    with DioExceptionMapper
    implements IGetNotesRepository {
  final GetNotesApi _getNotesApi;

  GetNotesRepository(this._getNotesApi);

  @override
  Future<GetNotesRespnse> getNotes() async {
    try {
      final response = await _getNotesApi.getNotes();

      return response;
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
