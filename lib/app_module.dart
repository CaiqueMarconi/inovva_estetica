import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/features/auth/presenter/auth_module.dart';
import 'package:innova_estetica/app/features/auth/store/login_store.dart';
import 'package:innova_estetica/app/features/clients/domain/usecase/i_get_clients_usecase.dart';
import 'package:innova_estetica/app/features/clients/infra/repository/get_client_repository_impl.dart';
import 'package:innova_estetica/app/features/clients/stores/clients_store.dart';
import 'package:innova_estetica/app/features/create_plan/controller/plan_controller.dart';
import 'package:innova_estetica/app/features/create_plan/domain/usecase/i_get_plans_usecase.dart';
import 'package:innova_estetica/app/features/create_plan/domain/usecase/i_insert_plan_usecase.dart';
import 'package:innova_estetica/app/features/create_plan/external/datasource/get_plans_datasource_impl.dart';
import 'package:innova_estetica/app/features/create_plan/external/datasource/insert_plan_datasource_impl.dart';
import 'package:innova_estetica/app/features/create_plan/infra/repository/get_plans_repository_impl.dart';
import 'package:innova_estetica/app/features/create_plan/infra/repository/insert_plan_repository_impl.dart';
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

        Bind.lazySingleton((i) => PlanController(i(), i())),
        Bind.lazySingleton((i) => LoginStore(i(), i())),

        // stores
        Bind.lazySingleton((i) => EventStore()),
        Bind.lazySingleton((i) => ClientsStore(i())),
        Bind.lazySingleton((i) => RegistrationStore(i(), i(), i(), i(), i(), i())),

        // usecase
        Bind.lazySingleton((i) => GetClientsUsecaseImpl(i())),
        Bind.lazySingleton((i) => GetPlansUsecaseImpl(i())),
        Bind.lazySingleton((i) => InsertPlanUsecaseImpl(i())),

        // repository
        Bind.lazySingleton((i) => GetClientsRepositoryImpl(i())),
        Bind.lazySingleton((i) => GetPlansRepositoryImpl(i())),
        Bind.lazySingleton((i) => InsertPlanRepositoryImpl(i())),

        // datasource
        Bind.lazySingleton((i) => GetClientsDatasourceImpl(i())),
        Bind.lazySingleton((i) => GetPlansDatasourceImpl(i())),
        Bind.lazySingleton((i) => InsertPlanDatasourceImpl(i())),
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
