import 'package:flutter/material.dart';
import 'package:innova_estetica/app/features/create_plan/domain/entities/plan_entity.dart';
import 'package:innova_estetica/app/features/create_plan/domain/usecase/i_get_plans_usecase.dart';
import 'package:innova_estetica/app/features/create_plan/domain/usecase/i_insert_plan_usecase.dart';
import 'package:asuka/asuka.dart' as asuka;

class PlanController {
  final IInsertPlanUsecase _insertPlanUsecase;
  final IGetPlansUsecase _getPlansUsecase;

  PlanController(this._insertPlanUsecase, this._getPlansUsecase);

  TextEditingController namePlanController = TextEditingController();
  TextEditingController qtdSectionsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> insertPlan() async {
    final params = PlanEntity(
      namePlan: namePlanController.text,
      description: descriptionController.text,
      qtdSections: int.parse(qtdSectionsController.text),
    );

    final result = await _insertPlanUsecase.call(params);
    result.fold(
      (l) => asuka.showSnackBar(
        SnackBar(
          content: const Text('Falha ao criar pacote', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red[900],
          duration: const Duration(seconds: 5),
        ),
      ),
      (r) => asuka.showSnackBar(
        SnackBar(
          content: const Text('Pacote Criado', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green[900],
          duration: const Duration(seconds: 5),
        ),
      ),
    );
  }

  Future<List<PlanEntity>> getPlans() async {
    List<PlanEntity> plans = [];
    final result = await _getPlansUsecase.call();
    result.fold(
        (l) => asuka.showSnackBar(
              SnackBar(
                content: const Text('Falha ao obter Pacotes', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.red[900],
                duration: const Duration(seconds: 5),
              ),
            ),
        (r) => plans = r);
    return plans;
  }
}
