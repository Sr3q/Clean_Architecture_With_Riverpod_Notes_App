import 'package:clean_note_app/features/create_note/application/services/create_note_service.dart';
import 'package:clean_note_app/features/create_note/data/dto/request/create_note_request.dart';
import 'package:clean_note_app/features/create_note/presentation/state/create_note_state.dart';
import 'package:clean_note_app/features/home/presentation/provider/get_notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createNoteProvider =
    AutoDisposeNotifierProvider<CreateNoteProvider, CreateNoteState>(
        CreateNoteProvider.new);

class CreateNoteProvider extends AutoDisposeNotifier<CreateNoteState> {
  @override
  CreateNoteState build() {
    return CreateNoteState();
  }

  Future<void> createNote() async {
    try {
      state = state.copyWith(
        isLoading: true,
        isSuccess: false,
        errorMessage: null,
      );

      final request = CreateNoteRequest.fromJson(state.noteForm);

      final result =
          await ref.read(createNoteServiceProvider).createNote(request);

      result.when(
        (success) {
          state = state.copyWith(
            isLoading: false,
            isSuccess: true,
          );

          ref.read(getNotesProvider.notifier).addNote(success);
        },
        (failure) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: failure.message,
          );
        },
      );
    } catch (e, s) {
      print(s);
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void setNoteForm(Map<String, dynamic> noteForm) {
    state = state.copyWith(noteForm: noteForm);
  }
}
