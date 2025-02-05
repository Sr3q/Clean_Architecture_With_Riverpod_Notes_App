class CodeVerificationResponse {
  final bool status;
  final String message;

  CodeVerificationResponse({
    required this.status,
    required this.message,
  });

  factory CodeVerificationResponse.fromJson(Map<String, dynamic> json) {
    return CodeVerificationResponse(
      status: json['status'],
      message: json['msg'],
    );
  }
}
