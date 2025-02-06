import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/mixin/dio_exception_mapper.dart';
import 'package:clean_note_app/features/search/data/dto/response/search_response.dart';
import 'package:clean_note_app/features/search/data/repository/isearch_repository.dart';
import 'package:clean_note_app/features/search/data/source/remote/search_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchRepositoryProvider = Provider.autoDispose<IsearchRepository>((ref) {
  final searchApi = ref.watch(searchApiProvider);

  return SearchRepository(searchApi);
});

final class SearchRepository with DioExceptionMapper implements IsearchRepository {
  final SearchApi _searchApi;

  SearchRepository(this._searchApi);

  @override
  Future<SearchResponse> search(String query) async {
    try {
      final response = await _searchApi.search(query);

      return response;
    }on DioException catch (e,s) {
      throw mapDioExceptionToFailure(e,s);
    }catch(e,s){
      throw Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      );
    }
  }
}