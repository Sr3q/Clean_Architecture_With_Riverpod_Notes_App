import 'package:clean_note_app/features/home/application/models/note_model.dart';

class GetNotesState {
  final List<NoteModel> notes;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  GetNotesState({
    this.notes = const [],
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  GetNotesState copyWith({
    List<NoteModel>? notes,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return GetNotesState(
      notes: notes ?? this.notes,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }
}
