class DeleteNoteState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  DeleteNoteState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  DeleteNoteState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return DeleteNoteState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }
}
