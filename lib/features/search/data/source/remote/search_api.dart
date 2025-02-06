import 'package:clean_note_app/core/data/remote/endpoint.dart';
import 'package:clean_note_app/core/data/remote/network_service.dart';
import 'package:clean_note_app/features/search/data/dto/response/search_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchApiProvider = Provider.autoDispose<SearchApi>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return SearchApi(dio);
});

class SearchApi {
  final Dio _dio;

  SearchApi(this._dio);

  Future<SearchResponse> search(String query) async {
    try {
      final response = await _dio.get("${EndPoint.searchNote}$query");

      return SearchResponse.fromJson(response.data);
    } catch (e, s) {
      print(e);
      print(s);
      rethrow;
    }
  }
}
