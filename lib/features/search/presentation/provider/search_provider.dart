import 'package:clean_note_app/features/search/application/services/search_service.dart';
import 'package:clean_note_app/features/search/presentation/state/search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = AutoDisposeNotifierProvider<SearchProvider, SearchState>(
    SearchProvider.new);

class SearchProvider extends AutoDisposeNotifier<SearchState> {
  @override
  SearchState build() {
    return SearchState();
  }

  Future<void> search(String query) async {
    try {
      state =
          state.copyWith(isLoading: true, isSuccess: false, errorMessage: null);

      final result = await ref.read(searchServiceProvider).search(query);

      result.when(
        (success) {
          state =
              state.copyWith(isLoading: false, isSuccess: true, notes: success);
        },
        (failure) {
          state =
              state.copyWith(isLoading: false, errorMessage: failure.message);
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void clear() => state = SearchState();
}
