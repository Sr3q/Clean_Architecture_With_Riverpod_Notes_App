class RegisterState {
  final bool isLoading;
  final bool isRegisterSuccess;
  final String? errorMessage;
  final Map<String, dynamic> registerForm;

  RegisterState({
    this.isLoading = false,
    this.isRegisterSuccess = false,
    this.errorMessage,
    this.registerForm = const {},
  });

  RegisterState copyWith({
    bool? isLoading,
    bool? isRegisterSuccess,
    String? errorMessage,
    Map<String, dynamic>? registerForm,
  }) =>
      RegisterState(
        isLoading: isLoading ?? this.isLoading,
        isRegisterSuccess: isRegisterSuccess ?? this.isRegisterSuccess,
        errorMessage: errorMessage,
        registerForm: registerForm ?? this.registerForm,
      );
}
