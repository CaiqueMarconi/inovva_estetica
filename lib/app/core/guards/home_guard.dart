import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../../features/auth/presenter/store/login_store.dart';

class HomeGuard extends RouteGuard {
  HomeGuard() : super(redirectTo: '/');
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return Modular.get<LoginStore>().state.isLogged;
  }
}
