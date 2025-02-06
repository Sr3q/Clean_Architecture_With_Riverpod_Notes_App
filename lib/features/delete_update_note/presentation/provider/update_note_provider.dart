import 'package:clean_note_app/features/delete_update_note/application/services/update/update_note_service.dart';
import 'package:clean_note_app/features/delete_update_note/data/dto/request/update_note_request.dart';
import 'package:clean_note_app/features/delete_update_note/presentation/state/update_note_state.dart';
import 'package:clean_note_app/features/home/presentation/provider/get_notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateNoteProvider =
    AutoDisposeNotifierProvider<UpdateNoteProvider, UpdateNoteState>(
        UpdateNoteProvider.new);

class UpdateNoteProvider extends AutoDisposeNotifier<UpdateNoteState> {
  @override
  UpdateNoteState build() {
    return UpdateNoteState();
  }

  Future<void> updateNote() async {
    try {
      state =
          state.copyWith(isLoading: true, isSuccess: false, errorMessage: null);

      final request = UpdateNoteRequest.fromJson(state.noteForm);

      final result =
          await ref.read(updateNoteServiceProvider).updateNote(request);

      result.when(
        (success) {
          state = state.copyWith(isLoading: false, isSuccess: true);

          ref.read(getNotesProvider.notifier).updateNote(success);
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

  void setNoteForm(Map<String, dynamic> noteForm) {
    state = state.copyWith(noteForm: noteForm);
  }
}
