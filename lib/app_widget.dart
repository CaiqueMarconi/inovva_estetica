import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/core/utils/const/strings_colors.dart';

import 'localizations_pt.dart';
import 'package:asuka/asuka.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp.router(
        builder: Asuka.builder,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          PTBRMaterialLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        locale: const Locale('pt', 'BR'),
        debugShowCheckedModeBanner: false,
        title: 'Inovva Estetica',
        theme: ThemeData(primaryColor: StringColors.primaryColor),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      ),
    );
  }
}
