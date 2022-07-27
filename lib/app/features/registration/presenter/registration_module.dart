import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/features/registration/domain/usecase/i_insert_client_usecase.dart';
import 'package:innova_estetica/app/features/registration/external/datasource/insert_adress_datasource_impl.dart';
import 'package:innova_estetica/app/features/registration/external/datasource/insert_client_datasource_impl.dart';
import 'package:innova_estetica/app/features/registration/infra/repository/insert_adress_repository_impl.dart';
import 'package:innova_estetica/app/features/registration/infra/repository/insert_client_repository_impl.dart';

import '../domain/usecase/i_insert_adress_usecase.dart';
import 'pages/registration_page.dart';

class RegistrationModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Controller

        // usecase
        Bind.lazySingleton((i) => InsertAdressUsecaseImpl(i())),
        Bind.lazySingleton((i) => InsertClientUsecaseImpl(i())),

        // repository
        Bind.lazySingleton((i) => InsertAdressRepositoryImpl(i())),
        Bind.lazySingleton((i) => InsertClientRepositoryImpl(i())),

        // datasource
        Bind.lazySingleton((i) => InsertAdressDatasourceImpl(i())),
        Bind.lazySingleton((i) => InsertCLientDatasource(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const RegistrationPage()),
      ];
}
