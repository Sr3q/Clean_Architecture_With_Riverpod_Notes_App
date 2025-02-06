import 'package:clean_note_app/common/models/note_model.dart';
import 'package:clean_note_app/features/home/application/services/get_notes_service.dart';
import 'package:clean_note_app/features/home/presentation/state/get_notes_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getNotesProvider =
    AutoDisposeNotifierProvider<GetNotesProvider, GetNotesState>(
        GetNotesProvider.new);

class GetNotesProvider extends AutoDisposeNotifier<GetNotesState> {
  @override
  GetNotesState build() {
    return GetNotesState();
  }

  Future<void> getNotes() async {
    try {
      state =
          state.copyWith(isLoading: true, isSuccess: false, errorMessage: null);

      final result = await ref.read(getNotesServiceProvider).getNotes();

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

  void addNote(NoteModel note) {
    final newNotes = [note, ...state.notes];

    state = state.copyWith(notes: newNotes);
  }

  void deleteNote(int noteId) {
    final newNotes = state.notes.where((n) => n.id != noteId).toList();

    state = state.copyWith(notes: newNotes);
  }

  void updateNote(NoteModel note) {
    List<NoteModel> newNotes =
        state.notes.where((n) => n.id != note.id).toList();

    newNotes = [note, ...newNotes];

    state = state.copyWith(notes: newNotes);
  }
}
