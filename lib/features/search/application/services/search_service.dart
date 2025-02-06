import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/common/models/note_model.dart';
import 'package:clean_note_app/features/search/application/services/isearch_service.dart';
import 'package:clean_note_app/features/search/data/repository/isearch_repository.dart';
import 'package:clean_note_app/features/search/data/repository/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final searchServiceProvider = Provider.autoDispose<IsearchService>((ref) {
  final searchRepository = ref.watch(searchRepositoryProvider);

  return SearchService(searchRepository);
});

final class SearchService implements IsearchService {
  final IsearchRepository _searchRepository;

  SearchService(this._searchRepository);

  @override
  Future<Result<List<NoteModel>, Failure>> search(String query) async {
    try {
      final response = await _searchRepository.search(query);

      return Success(response.notes);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(Failure(
        message: e.toString(),
        exception: e as Exception,
        stackTrace: s,
      ));
    }
  }
}
