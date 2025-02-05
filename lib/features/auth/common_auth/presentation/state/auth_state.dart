import 'package:clean_note_app/features/auth/common_auth/application/model/user_model.dart';

class AuthState {
  final bool isAuthuthenticated;
  final UserModel? user;

  AuthState({
    this.isAuthuthenticated = false,
    this.user,
  });

  AuthState copyWith({
    bool? isAuthuthenticated,
    UserModel? user,
  }) {
    return AuthState(
      isAuthuthenticated: isAuthuthenticated ?? this.isAuthuthenticated,
      user: user,
    );
  }

  @override
  String toString() {
    return 'AuthState{isAuthuthenticated: $isAuthuthenticated, user: $user}';
  }
}
