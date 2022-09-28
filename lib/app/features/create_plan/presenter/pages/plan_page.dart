import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:innova_estetica/app/core/utils/const/strings_colors.dart';
import 'package:innova_estetica/app/core/widgets/text_form_field_custom.dart';
import 'package:innova_estetica/app/features/create_plan/controller/plan_controller.dart';
import 'package:innova_estetica/app/features/registration/presenter/pages/registration_page.dart';

class PlanPage extends StatelessWidget {
  PlanPage({Key? key}) : super(key: key);

  final planController = Modular.get<PlanController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: StringColors.pinkClear,
              height: width * 0.015,
              width: double.maxFinite,
            ),
          ),
          Expanded(
            child: SizedBox(
              width: width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: width * 0.020),
                  TextTitleComum(width: width, textTitle: 'Crie um Pacote'),
                  SizedBox(height: width * 0.020),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextFormFieldCustom(
                          labelText: 'Nome do Pacote',
                          controller: planController.namePlanController,
                        ),
                      ),
                      SizedBox(width: width * 0.010),
                      Expanded(
                        child: TextFormFieldCustom(
                          labelText: 'Qtd Sessões',
                          controller: planController.qtdSectionsController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: width * 0.010),
                  TextFormFieldCustom(
                    labelText: 'Descrição',
                    controller: planController.descriptionController,
                  ),
                  SizedBox(height: width * 0.015),
                  ElevatedButtonCustom(
                    width: width,
                    text: 'Criar Pacote',
                    function: () async {
                      await planController.insertPlan();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
