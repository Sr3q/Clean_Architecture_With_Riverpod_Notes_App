import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteNoteApiProvider = Provider.autoDispose<DeleteNoteApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return DeleteNoteApi(dio);
});

class DeleteNoteApi {
  final Dio _dio;

  DeleteNoteApi(this._dio);

  Future<void> deleteNote(int id) async {
    try {
      await _dio.delete("${EndPoint.deleteNote}$id");
    } catch (e) {
      rethrow;
    }
  }
}
