class LoginState {
  final bool isLoading;
  final bool isLoginSuccess;
  final String? errorMessage;
  final Map<String, dynamic> loginForm;

  LoginState({
    this.isLoading = false,
    this.isLoginSuccess = false,
    this.errorMessage,
    this.loginForm = const <String, dynamic>{},
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isLoginSuccess,
    String? errorMessage,
    Map<String, dynamic>? loginForm,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
      errorMessage: errorMessage,
      loginForm: loginForm ?? this.loginForm,
    );
  }

  @override
  String toString() {
    return 'LoginState{isLoading: $isLoading, isLoginSuccess: $isLoginSuccess, errorMessage: $errorMessage, loginForm: $loginForm}';
  }
}
