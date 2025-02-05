class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    email: json['email'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };

  @override
  String toString() => 'LoginRequest(email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginRequest &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}