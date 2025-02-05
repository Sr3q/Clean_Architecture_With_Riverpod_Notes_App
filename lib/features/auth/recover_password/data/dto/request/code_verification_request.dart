class CodeVerificationRequest {
  final String otp;
  final String password;
  final String email;

  CodeVerificationRequest({
    required this.otp,
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'otp': otp,
        'password': password,
        'email': email,
      };

  factory CodeVerificationRequest.fromJson(Map<String, dynamic> json) =>
      CodeVerificationRequest(
        otp: json['otp'],
        password: json['password'],
        email: json['email'],
      );
}
