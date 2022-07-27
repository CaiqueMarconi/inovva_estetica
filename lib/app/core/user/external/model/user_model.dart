import 'package:innova_estetica/app/core/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String name;
  final int id;
  const UserModel({
    required this.name,
    required this.id,
  }) : super(name: name, id: id);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      id: map['id'] as int,
    );
  }
}
