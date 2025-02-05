class RegisterRequest {
  final String email;
  final String password;
  final String name;
  RegisterRequest({
    required this.email,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'name': name,
      };

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        email: json['email'],
        password: json['password'],
        name: json['name'],
      );

  @override
  String toString() =>
      'RegesterRequest(email: $email, password: $password, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterRequest &&
        other.email == email &&
        other.password == password &&
        other.name == name;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode ^ name.hashCode;
}
