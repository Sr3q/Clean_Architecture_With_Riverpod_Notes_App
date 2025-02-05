import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:clean_note_app/features/create_note/data/dto/request/create_note_request.dart';
import 'package:clean_note_app/features/create_note/data/dto/response/create_note_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createNoteApiProvider = Provider.autoDispose<CreateNoteApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return CreateNoteApi(dio);
});

class CreateNoteApi {
  final Dio _dio;

  CreateNoteApi(this._dio);

  Future<CreateNoteResponse> createNote(CreateNoteRequest request) async {
    try {
      final response = await _dio.post(EndPoint.createNote, data: request.tojson());

      return CreateNoteResponse.fromJson(response.data);
    }catch(e){
      rethrow;
    }
  }
}
