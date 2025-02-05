class ResendCodeResponse {
  final bool status;
  final String message;

  ResendCodeResponse({required this.status, required this.message});

  factory ResendCodeResponse.fromJson(Map<String, dynamic> json) {
    return ResendCodeResponse(
      status: json['status'],
      message: json['msg'],
    );
  }
}
