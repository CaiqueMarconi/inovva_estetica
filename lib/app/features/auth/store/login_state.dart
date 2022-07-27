import 'package:innova_estetica/app/core/user/domain/entities/user_entity.dart';

class LoginState {
  final UserEntity user;

  LoginState({required this.user});

  factory LoginState.init() => LoginState(user: const UserEntity(name: '', id: 0));

  LoginState copyWith({
    UserEntity? user,
  }) {
    return LoginState(user: user ?? this.user);
  }
}
