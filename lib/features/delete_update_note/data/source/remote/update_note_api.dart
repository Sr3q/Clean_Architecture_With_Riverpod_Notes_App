import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:clean_note_app/features/delete_update_note/data/dto/request/update_note_request.dart';
import 'package:clean_note_app/features/delete_update_note/data/dto/response/update_note_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateNoteApiProvider = Provider.autoDispose<UpdateNoteApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return UpdateNoteApi(dio);
});

class UpdateNoteApi {
  final Dio _dio;

  UpdateNoteApi(this._dio);

  Future<UpdateNoteResponse> updateNote(UpdateNoteRequest request) async {
    try {
      final response = await _dio.put("${EndPoint.updateNote}${request.id}", data: request.toJson());
      return UpdateNoteResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
