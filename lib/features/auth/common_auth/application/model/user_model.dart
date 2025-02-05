class UserModel {
  final String email;
  final String name;
  final String? emailVerifiedAt;

  UserModel({
    required this.email,
    required this.name,
    required this.emailVerifiedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      name: json['name'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'email_verified_at': emailVerifiedAt,
      };

  @override
  String toString() => 'UserModel(email: $email, name: $name, emailVerifiedAt: $emailVerifiedAt)';

  UserModel copyWith({
    String? email,
    String? name,
    String? emailVerifiedAt,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      emailVerifiedAt: emailVerifiedAt,
    );
  }
}
