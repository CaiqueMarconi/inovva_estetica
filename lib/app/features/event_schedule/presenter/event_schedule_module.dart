import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/features/event_schedule/presenter/pages/event_schedule_page.dart';

class EventScheduleModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => EventSchedulePage()),
      ];
}
