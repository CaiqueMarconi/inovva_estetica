import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/features/home_page/presenter/pages/home_page.dart';
import 'package:innova_estetica/app/features/registration/domain/usecase/i_insert_measurements_usecase.dart';
import 'package:innova_estetica/app/features/registration/external/datasource/insert_measurements_datasource_impl.dart';
import 'package:innova_estetica/app/features/registration/infra/repository/insert_measurements_impl.dart';
import 'package:innova_estetica/app/features/registration/domain/usecase/i_insert_adress_usecase.dart';
import 'package:innova_estetica/app/features/registration/domain/usecase/i_insert_client_usecase.dart';
import 'package:innova_estetica/app/features/registration/external/datasource/insert_adress_datasource_impl.dart';
import 'package:innova_estetica/app/features/registration/external/datasource/insert_client_datasource_impl.dart';
import 'package:innova_estetica/app/features/registration/infra/repository/insert_adress_repository_impl.dart';
import 'package:innova_estetica/app/features/registration/infra/repository/insert_client_repository_impl.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // usecase
        Bind.lazySingleton((i) => InsertAdressUsecaseImpl(i())),
        Bind.lazySingleton((i) => InsertClientUsecaseImpl(i())),
        Bind.lazySingleton((i) => InsertMeasurementsUsecaseImpl(i())),

        // repository
        Bind.lazySingleton((i) => InsertAdressRepositoryImpl(i())),
        Bind.lazySingleton((i) => InsertClientRepositoryImpl(i())),
        Bind.lazySingleton((i) => InsertMeasurementsRepositoryImpl(i())),

        // datasource
        Bind.lazySingleton((i) => InsertAdressDatasourceImpl(i())),
        Bind.lazySingleton((i) => InsertCLientDatasource(i())),
        Bind.lazySingleton((i) => InsertMeasurementsDatasourceImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => HomePage(user: args.data)),
      ];
}
