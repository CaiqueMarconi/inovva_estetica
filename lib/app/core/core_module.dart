import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:innova_estetica/app/core/services/firebase/firebase_service.dart';
import 'package:innova_estetica/app/core/services/hasura/hasura_service.dart';
import 'package:innova_estetica/app/core/user/domain/usecase/i_get_user_usecase.dart';
import 'package:innova_estetica/app/core/user/external/datasource/get_user_datasource_impl.dart';
import 'package:innova_estetica/app/core/user/infra/repository/get_user_repository_impl.dart';
import 'package:innova_estetica/app/core/user/store/user_store.dart';

import 'services/dio/dio_service.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // HasuraService
        Bind.lazySingleton(
          (i) => HasuraConnect('https://inovva-estetica.hasura.app/v1/graphql',
              headers: {'x-hasura-admin-secret': 'wx5GmMmJ1OWOrUgMabsTuRyAaEsRU1UeWgV8UaJIagIKzLunR9Io8G3Nc3loQ4dK'}),
          export: true,
        ),
        Bind.factory((i) => HasuraService(i()), export: true),

        // http
        Bind.factory((i) => Dio(i()), export: true),
        Bind.factory((i) => DioService(i()), export: true),

        // AuthService
        Bind.lazySingleton((i) => FirebaseAuth.instance, export: true),
        Bind.lazySingleton((i) => FirebaseService(i()), export: true),

        // store
        Bind.factory((i) => UserStore(i())),

        // usecase
        Bind.factory((i) => GetUserUsecaseImpl(i())),

        // repository
        Bind.factory((i) => GetUserRepositoryImpl(i())),

        // datasource
        Bind.factory((i) => GetUserDatasourceImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [];
}
