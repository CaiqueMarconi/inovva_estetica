import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/core/utils/const/strings_colors.dart';

import 'package:innova_estetica/app/features/auth/store/login_store.dart';
import 'package:innova_estetica/app/features/clients/presenter/clients_page.dart';
import 'package:innova_estetica/app/features/create_plan/presentation/pages/plan_page.dart';
import 'package:innova_estetica/app/features/event_schedule/presenter/pages/event_schedule_page.dart';
import 'package:innova_estetica/app/features/registration/presenter/pages/registration_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final loginController = Modular.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.50;
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: StringColors.primaryColor,
          bottom: TabBar(
            //indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: StringColors.pinkClear,
            labelColor: StringColors.pinkClear,
            unselectedLabelColor: StringColors.pinkClear,
            labelStyle: TextStyle(
              fontSize: width * 0.025,
            ),
            tabs: const [
              Tab(
                text: 'Cadastro',
              ),
              Tab(
                text: 'Pacotes',
              ),
              Tab(
                text: 'Clientes',
              ),
              Tab(
                text: 'Agenda',
              ),
              Tab(
                text: 'Controle de Caixa',
              ),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Inovva Estetica',
                style: TextStyle(
                  fontSize: width * 0.035,
                  color: StringColors.pinkClear,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  loginController.signOut();
                },
                child: const Text(
                  'Sair',
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const RegistrationPage(),
            PlanPage(),
            const ClientsPage(),
            EventSchedulePage(),
            const Icon(Icons.directions_car),
          ],
        ),
      ),
    );
  }
}
