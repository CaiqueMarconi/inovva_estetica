import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/features/auth/presenter/pages/login_page.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => LoginPage()),
      ];
}
