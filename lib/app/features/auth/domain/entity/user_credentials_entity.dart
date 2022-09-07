import 'package:equatable/equatable.dart';

class UserCredentialEntity extends Equatable {
  final String email;
  final String uid;

  const UserCredentialEntity({
    required this.email,
    required this.uid,
  });

  @override
  List<Object?> get props => [email, uid];
}
