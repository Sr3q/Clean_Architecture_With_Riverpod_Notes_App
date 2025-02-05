class SendCodeState {
  final bool isLoading;
  final bool isCodeSendSuccess;
  final String? errorMessage;
  final String email;

  SendCodeState({
    this.isLoading = false,
    this.isCodeSendSuccess = false,
    this.errorMessage,
    this.email = '',
  });

  SendCodeState copyWith({
    bool? isLoading,
    bool? isCodeSendSuccess,
    String? errorMessage,
    String? email,
  }) {
    return SendCodeState(
      isLoading: isLoading ?? this.isLoading,
      isCodeSendSuccess: isCodeSendSuccess ?? this.isCodeSendSuccess,
      errorMessage: errorMessage,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return 'SendCodeState{isLoading: $isLoading, isCodeSendSuccess: $isCodeSendSuccess, errorMessage: $errorMessage, email: $email}';
  }
}
