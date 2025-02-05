class CodeVerificationState {
  final bool isLoading;
  final bool isPasswordChangeSuccess;
  final String? errorMessage;
  final Map<String, dynamic> passwordChangeForm;

  CodeVerificationState({
    this.isLoading = false,
    this.isPasswordChangeSuccess = false,
    this.errorMessage,
    this.passwordChangeForm = const <String, dynamic>{},
  });

  CodeVerificationState copyWith({
    bool? isLoading,
    bool? isPasswordChangeSuccess,
    String? errorMessage,
    Map<String, dynamic>? passwordChangeForm,
  }) {
    return CodeVerificationState(
      isLoading: isLoading ?? this.isLoading,
      isPasswordChangeSuccess: isPasswordChangeSuccess ?? this.isPasswordChangeSuccess,
      errorMessage: errorMessage,
      passwordChangeForm: passwordChangeForm ?? this.passwordChangeForm,
    );
  }

  @override
  String toString() {
    return 'CodeVerificationState{isLoading: $isLoading, isPasswordChangeSuccess: $isPasswordChangeSuccess, errorMessage: $errorMessage, passwordChangeForm: $passwordChangeForm}';
  }
}
