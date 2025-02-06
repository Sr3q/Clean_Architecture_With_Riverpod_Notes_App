import 'package:clean_note_app/features/delete_update_note/application/services/delete/delete_note_service.dart';
import 'package:clean_note_app/features/delete_update_note/presentation/state/delete_note_state.dart';
import 'package:clean_note_app/features/home/presentation/provider/get_notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteNoteProvider = AutoDisposeNotifierProvider<DeleteNoteProvider, DeleteNoteState>(
  DeleteNoteProvider.new);

class DeleteNoteProvider extends AutoDisposeNotifier<DeleteNoteState> {
  @override
  DeleteNoteState build() {
    return DeleteNoteState();
  }

  Future<void> deleteNote(int id) async {
    try {
      state =
          state.copyWith(isLoading: true, isSuccess: false, errorMessage: null);

      final result = await ref.read(deleteNoteServiceProvider).deleteNote(id);

      result.when(
        (success) {
          state = state.copyWith(isLoading: false, isSuccess: true);

          ref.read(getNotesProvider.notifier).deleteNote(id);
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
}
