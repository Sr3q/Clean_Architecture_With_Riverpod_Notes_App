class ResendCodeState {
  final bool isLoading;
  final bool isCodeResendSuccess;
  final String? errorMessage;

  ResendCodeState({
    this.isLoading = false,
    this.isCodeResendSuccess = false,
    this.errorMessage,
  });

  ResendCodeState copyWith({
    bool? isLoading,
    bool? isCodeResendSuccess,
    String? errorMessage,
  }) {
    return ResendCodeState(
      isLoading: isLoading ?? this.isLoading,
      isCodeResendSuccess: isCodeResendSuccess ?? this.isCodeResendSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  String toString() {
    return 'ResendCodeState{isLoading: $isLoading, isCodeResendSuccess: $isCodeResendSuccess, errorMessage: $errorMessage}';
  }
}
