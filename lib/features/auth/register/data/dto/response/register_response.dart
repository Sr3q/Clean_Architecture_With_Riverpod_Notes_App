class RegisterResponse {
  final bool status;
  final String message;
  final RegisterData data;

  RegisterResponse({required this.status, required this.message, required this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> jsonData) {
    return RegisterResponse(
      status: jsonData["status"],
      message: jsonData["msg"],
      data: RegisterData.fromJson(jsonData["data"]),
    );
  }
}

class RegisterData {
  final String token;
  final UserData user;

  RegisterData({
    required this.token,
    required this.user,
  });

  factory RegisterData.fromJson(Map<String, dynamic> jsonData) {
    return RegisterData(
      token: jsonData["token"],
      user: UserData.fromJson(jsonData["user"]),
    );
  }
}

class UserData {
  final String email;
  final String name;
  final String? emailVerifiedAt;

  UserData({
    required this.email,
    required this.name,
    required this.emailVerifiedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> jsonData) {
    return UserData(
      email: jsonData["email"],
      name: jsonData["name"],
      emailVerifiedAt: jsonData["email_verified_at"],
    );
  }
}
