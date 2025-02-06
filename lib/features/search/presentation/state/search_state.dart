import 'package:clean_note_app/common/models/note_model.dart';

class SearchState {
  final List<NoteModel> notes;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  
  SearchState({
    this.notes = const [],
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  SearchState copyWith({
    List<NoteModel>? notes,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return SearchState(
      notes: notes ?? this.notes,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }
}
