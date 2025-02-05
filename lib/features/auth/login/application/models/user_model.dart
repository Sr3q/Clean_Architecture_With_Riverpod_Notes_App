class UserModel {
  final String token;
  final String email;
  final String name;
  final String? emailVerifiedAt;

  UserModel({
    required this.email,
    required this.name,
    required this.emailVerifiedAt,
    required this.token,
  });

  Map<String, dynamic> tojson() => {'email': email, 'name': name, 'email_verified_at': emailVerifiedAt};

  @override
  String toString() => 'UserModel{email: $email, name: $name, emailVerifiedAt: $emailVerifiedAt, token: $token}';
}
