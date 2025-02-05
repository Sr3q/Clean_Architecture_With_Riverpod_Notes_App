class EmailVerificationState {
  final bool isLoading;
  final bool isEmailVerificationSuccess;
  final String? errorMessage;
  final String otp;

  EmailVerificationState({
    this.isLoading = false,
    this.isEmailVerificationSuccess = false,
    this.errorMessage,
    this.otp = '',
  });

  EmailVerificationState copyWith({
    bool? isLoading,
    bool? isEmailVerificationSuccess,
    String? errorMessage,
    String? otp,
  }) {
    return EmailVerificationState(
      isLoading: isLoading ?? this.isLoading,
      isEmailVerificationSuccess: isEmailVerificationSuccess ?? this.isEmailVerificationSuccess,
      errorMessage: errorMessage,
      otp: otp ?? this.otp,
    );
  }

  @override
  String toString() {
    return 'EmailVerificationState{isLoading: $isLoading, isEmailVerificationSuccess: $isEmailVerificationSuccess, errorMessage: $errorMessage, otp: $otp}';
  }
}
