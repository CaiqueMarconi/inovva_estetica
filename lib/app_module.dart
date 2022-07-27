import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/features/auth/presenter/auth_module.dart';
import 'package:innova_estetica/app/features/auth/store/login_store.dart';
import 'package:innova_estetica/app/features/clients/domain/usecase/i_get_clients_usecase.dart';
import 'package:innova_estetica/app/features/clients/infra/repository/get_client_repository_impl.dart';
import 'package:innova_estetica/app/features/clients/stores/clients_store.dart';
import 'package:innova_estetica/app/features/create_plan/controller/plan_controller.dart';
import 'package:innova_estetica/app/features/event_schedule/stores/event_store.dart';
import 'package:innova_estetica/app/features/registration/stores/registration_store.dart';

import 'app/core/core_module.dart';
import 'app/features/clients/external/datasource/get_clients_datasource_impl.dart';
import 'app/features/home_page/presenter/home_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [
        // Controllers

        Bind.lazySingleton((i) => PlanController()),
        Bind.lazySingleton((i) => LoginStore(i(), i())),

        // stores
        Bind.lazySingleton((i) => EventStore()),
        Bind.lazySingleton((i) => ClientsStore(i())),
        Bind.lazySingleton((i) => RegistrationStore(i(), i(), i(), i())),

        // usecase
        Bind.lazySingleton((i) => GetClientsUsecaseImpl(i())),

        // repository
        Bind.lazySingleton((i) => GetClientsRepositoryImpl(i())),

        // datasource
        Bind.lazySingleton((i) => GetClientsDatasourceImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: AuthModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
