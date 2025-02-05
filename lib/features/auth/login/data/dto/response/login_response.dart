class LoginResponse {
  final bool status;
  final String message;
  final LoginData data;

  LoginResponse({required this.status, required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> jsonData) {
    return LoginResponse(
      status: jsonData["status"],
      message: jsonData["msg"],
      data: LoginData.fromJson(jsonData["data"]),
    );
  }
}

class LoginData {
  final String token;
  final UserData user;

  LoginData({
    required this.token,
    required this.user,
  });

  factory LoginData.fromJson(Map<String, dynamic> jsonData) {
    return LoginData(
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
