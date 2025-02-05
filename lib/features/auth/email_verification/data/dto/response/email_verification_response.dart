class EmailVerificationResponse {
  final bool status;
  final String message;

  EmailVerificationResponse({required this.status, required this.message});

  factory EmailVerificationResponse.fromJson(Map<String, dynamic> json) {
    return EmailVerificationResponse(
      status: json['status'],
      message: json['msg'],
    );
  }
}
