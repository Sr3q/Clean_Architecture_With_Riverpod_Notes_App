class SendCodeResponse {
  final bool status;
  final String message;

  SendCodeResponse({
    required this.status,
    required this.message,
  });

  factory SendCodeResponse.fromJson(Map<String, dynamic> json) {
    return SendCodeResponse(
      status: json['status'],
      message: json['msg'],
    );
  }
}
