import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/core/guards/home_guard.dart';
import 'package:innova_estetica/app/features/auth/domain/usecase/firebase_login_with_email_usecase.dart';
import 'package:innova_estetica/app/features/auth/external/datasource/firebase_login_with_email_datasource_impl.dart';
import 'package:innova_estetica/app/features/auth/infra/repository/firebase_login_with_email_repository_impl.dart';
import 'package:innova_estetica/app/features/auth/presenter/auth_module.dart';
import 'package:innova_estetica/app/features/auth/store/login_store.dart';
import 'package:innova_estetica/app/features/clients/domain/usecase/i_get_clients_usecase.dart';
import 'package:innova_estetica/app/features/clients/infra/repository/get_client_repository_impl.dart';
import 'package:innova_estetica/app/features/control_cash/domain/usecase/i_get_payments_usecase.dart';
import 'package:innova_estetica/app/features/control_cash/domain/usecase/i_insert_payments_usecase.dart';
import 'package:innova_estetica/app/features/control_cash/external/datasource/get_payments_datasource_impl.dart';
import 'package:innova_estetica/app/features/control_cash/external/datasource/insert_payments_datasource.dart';
import 'package:innova_estetica/app/features/control_cash/infra/repository/get_payments_repository.dart';
import 'package:innova_estetica/app/features/control_cash/infra/repository/insert_payments_repository.dart';
import 'package:innova_estetica/app/features/create_plan/controller/plan_controller.dart';
import 'package:innova_estetica/app/features/create_plan/domain/usecase/i_get_plans_usecase.dart';
import 'package:innova_estetica/app/features/create_plan/domain/usecase/i_insert_plan_usecase.dart';
import 'package:innova_estetica/app/features/create_plan/external/datasource/get_plans_datasource_impl.dart';
import 'package:innova_estetica/app/features/create_plan/external/datasource/insert_plan_datasource_impl.dart';
import 'package:innova_estetica/app/features/create_plan/infra/repository/get_plans_repository_impl.dart';
import 'package:innova_estetica/app/features/create_plan/infra/repository/insert_plan_repository_impl.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/usecase/i_get_event_usecase.dart';
import 'package:innova_estetica/app/features/event_schedule/domain/usecase/i_insert_event_usecase.dart';
import 'package:innova_estetica/app/features/event_schedule/external/datasource/get_event_datasource_impl.dart';
import 'package:innova_estetica/app/features/event_schedule/external/datasource/insert_event_datasource_impl.dart';
import 'package:innova_estetica/app/features/event_schedule/infra/repository/get_event_repository_impl.dart';
import 'package:innova_estetica/app/features/event_schedule/infra/repository/insert_event_repository_impl.dart';
import 'package:innova_estetica/app/features/event_schedule/stores/event_store.dart';
import 'package:innova_estetica/app/features/registration/stores/registration_store.dart';

import 'app/core/core_module.dart';
import 'app/features/clients/external/datasource/get_clients_datasource_impl.dart';
import 'app/features/clients/presenter/stores/clients_store.dart';
import 'app/features/control_cash/presenter/stores/control_cash_store.dart';
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
        Bind.lazySingleton((i) => LoginStore(i(), i(), i())),

        // stores
        Bind.lazySingleton((i) => EventStore(i(), i(), i())),
        Bind.lazySingleton((i) => ClientsStore(i())),
        Bind.lazySingleton((i) => RegistrationStore(i(), i(), i(), i(), i(), i())),
        Bind.lazySingleton((i) => ControlCashStore(i(), i(), i())),

        // usecase
        Bind.lazySingleton((i) => GetClientsUsecaseImpl(i())),
        Bind.lazySingleton((i) => GetPlansUsecaseImpl(i())),
        Bind.lazySingleton((i) => InsertPlanUsecaseImpl(i())),
        Bind.lazySingleton((i) => InsertEventUsecaseImpl(i())),
        Bind.lazySingleton((i) => GetEventUsecaseImpl(i())),
        Bind.lazySingleton((i) => FirebaseLoginEmailUsecaseImpl(i())),
        Bind.lazySingleton((i) => GetPaymentsUsecaseImpl(i())),
        Bind.lazySingleton((i) => InsertPaymentsUsecase(i())),

        // repository
        Bind.lazySingleton((i) => GetClientsRepositoryImpl(i())),
        Bind.lazySingleton((i) => GetPlansRepositoryImpl(i())),
        Bind.lazySingleton((i) => InsertPlanRepositoryImpl(i())),
        Bind.lazySingleton((i) => InsertEventRepositoryImpl(i())),
        Bind.lazySingleton((i) => GetEventRepositoryImpl(i())),
        Bind.lazySingleton((i) => FirebaseLoginWithEmailRepositoryImpl(i())),
        Bind.lazySingleton((i) => GetPaymentsRepositoryImpl(i())),
        Bind.lazySingleton((i) => InsertPaymentsRepository(i())),

        // datasource
        Bind.lazySingleton((i) => GetClientsDatasourceImpl(i())),
        Bind.lazySingleton((i) => GetPlansDatasourceImpl(i())),
        Bind.lazySingleton((i) => InsertPlanDatasourceImpl(i())),
        Bind.lazySingleton((i) => InsertEventDatasourceImpl(i())),
        Bind.lazySingleton((i) => GetEventDatasourceImpl(i())),
        Bind.lazySingleton((i) => FirebaseLoginWithEmailDatasourceImpl(i())),
        Bind.lazySingleton((i) => GetPaymentsDatasourceImpl(i())),
        Bind.lazySingleton((i) => InsertPaymentsDatasource(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: AuthModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute('/home', module: HomeModule(), guards: [HomeGuard()]),
      ];
}
