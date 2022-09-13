import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/features/control_cash/presenter/control_cash_page.dart';

class ControlCashModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [ChildRoute('/', child: (_, __) => const ControlCashPage())];
}
