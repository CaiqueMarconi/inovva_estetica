// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_triple/flutter_triple.dart';

import 'package:innova_estetica/app/core/user/domain/usecase/i_get_user_usecase.dart';
import 'package:innova_estetica/app/core/user/store/user_state.dart';

class UserStore extends StreamStore<Exception, UserState> {
  final IGetUserUsecase _getUserUsecase;
  UserStore(
    this._getUserUsecase,
  ) : super(UserState.init());

  Future<void> getUser(String email) async {
    final result = await _getUserUsecase.call(email);
    result.fold((l) => l, (r) {
      update(state.copyWith(currentUser: r));
    });
  }
}
