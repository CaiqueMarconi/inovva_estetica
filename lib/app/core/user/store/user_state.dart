import 'package:innova_estetica/app/core/user/domain/entities/user_entity.dart';

class UserState {
  final UserEntity currentUser;
  UserState({
    required this.currentUser,
  });

  factory UserState.init() => UserState(
        currentUser: const UserEntity(name: '', id: 0),
      );

  UserState copyWith({
    UserEntity? currentUser,
  }) {
    return UserState(
      currentUser: currentUser ?? this.currentUser,
    );
  }
}
