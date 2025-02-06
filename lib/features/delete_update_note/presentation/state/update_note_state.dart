class UpdateNoteState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final Map<String, dynamic> noteForm;

  UpdateNoteState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.noteForm = const {},
  });

  UpdateNoteState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    Map<String, dynamic>? noteForm,
  }) {
    return UpdateNoteState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      noteForm: noteForm ?? this.noteForm,
    );
  }
}
