class LogoutState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  LogoutState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  LogoutState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return LogoutState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }
}
