class EmailVerificationRequest {
  final String otp;

  EmailVerificationRequest(this.otp);

  Map<String, dynamic> toJson() => {'otp': otp};

  @override
  String toString() => 'EmailVerificationRequest(otp: $otp)';
}
