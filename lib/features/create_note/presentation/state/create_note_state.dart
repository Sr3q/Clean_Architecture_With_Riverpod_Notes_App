class CreateNoteState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final Map<String, dynamic> noteForm;

  CreateNoteState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.noteForm=const {},
  });

  CreateNoteState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    Map<String, dynamic>? noteForm,
  }) {
    return CreateNoteState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      noteForm: noteForm ?? this.noteForm,
    );
  }
}
