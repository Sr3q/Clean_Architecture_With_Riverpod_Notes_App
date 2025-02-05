import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:clean_note_app/features/home/data/dto/response/get_notes_respnse.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getNotesApiProvider = Provider.autoDispose<GetNotesApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return GetNotesApi(dio);
});

class GetNotesApi {
  final Dio _dio;

  GetNotesApi(this._dio);

  Future<GetNotesRespnse> getNotes() async {
    try {
      final response = await _dio.get(EndPoint.getNotes);

      return GetNotesRespnse.fromjson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
