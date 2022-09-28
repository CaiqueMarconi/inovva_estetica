import 'package:innova_estetica/app/core/user/domain/entities/user_entity.dart';

class LoginState {
  final UserEntity user;
  final bool isLogged;

  LoginState({
    required this.user,
    required this.isLogged,
  });

  factory LoginState.init() => LoginState(
        isLogged: false,
        user: const UserEntity(name: '', id: -1),
      );

  LoginState copyWith({
    UserEntity? user,
    bool? isLogged,
  }) {
    return LoginState(
      user: user ?? this.user,
      isLogged: isLogged ?? this.isLogged,
    );
  }
}
