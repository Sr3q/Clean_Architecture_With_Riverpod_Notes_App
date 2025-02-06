import 'package:clean_note_app/features/search/data/dto/response/search_response.dart';

abstract interface class IsearchRepository {
  Future<SearchResponse> search(String query);
}