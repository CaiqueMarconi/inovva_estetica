// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:asuka/asuka.dart';
import 'package:innova_estetica/app/core/services/dio/i_dio_service.dart';
import 'package:innova_estetica/app/features/create_plan/controller/plan_controller.dart';
import 'package:innova_estetica/app/features/registration/domain/entities/measurements_entity.dart';
import 'package:innova_estetica/app/features/registration/domain/usecase/i_insert_adress_usecase.dart';
import 'package:innova_estetica/app/features/registration/domain/usecase/i_insert_measurements_usecase.dart';

import '../../../core/user/domain/entities/user_entity.dart';
import '../../auth/presenter/store/login_store.dart';
import '../domain/entities/adress_entity.dart';
import '../domain/entities/client_data_entity.dart';
import '../domain/usecase/i_insert_client_usecase.dart';
import 'registration_state.dart';

class RegistrationStore extends StreamStore<Exception, RegistrationState> {
  final IInsertAdressUsecase _insertAdressUsecase;
  final IInsertClientUsecase _insertClientUsecase;
  final IInsertMeasurementsUsecase _iInsertMeasurementsUsecase;
  final LoginStore loginStore;
  final PlanController controllerPlan;
  final IDioService _dioService;

  RegistrationStore(
    this._insertAdressUsecase,
    this._insertClientUsecase,
    this._iInsertMeasurementsUsecase,
    this.loginStore,
    this.controllerPlan,
    this._dioService,
  ) : super(RegistrationState.init());

  UserEntity get user => loginStore.state.user;

  TextEditingController nameController = TextEditingController();
  TextEditingController? cpfController = TextEditingController();
  TextEditingController? birthDataController = TextEditingController();
  TextEditingController? ageController = TextEditingController();
  TextEditingController? planController = TextEditingController();
  TextEditingController? procedimentController = TextEditingController();
  TextEditingController? weightController = TextEditingController();
  TextEditingController? qtdSectionsController = TextEditingController();
  TextEditingController? waistController = TextEditingController();
  TextEditingController? heightController = TextEditingController();
  TextEditingController? abdomenController = TextEditingController();
  TextEditingController? hipController = TextEditingController();
  TextEditingController? idClientController = TextEditingController();
  TextEditingController? cepController = TextEditingController();
  TextEditingController? roadController = TextEditingController();
  TextEditingController? districtController = TextEditingController();
  TextEditingController? numberController = TextEditingController();

  void clearForm() {
    nameController.clear();
    cpfController?.clear();
    birthDataController?.clear();
    ageController?.clear();
    planController?.clear();
    procedimentController?.clear();
    weightController?.clear();
    qtdSectionsController?.clear();
    waistController?.clear();
    heightController?.clear();
    abdomenController?.clear();
    hipController?.clear();
    idClientController?.clear();
    cepController?.clear();
    roadController?.clear();
    districtController?.clear();
    numberController?.clear();
  }

  void changeAddMeasurements() {
    update(state.copyWith(addmeasurements: !state.addmeasurements));
  }

  Future<void> insertClient(context) async {
    try {
      Asuka.showSnackBar(
        SnackBar(
          content: const Text('Inserindo usuario...', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue[900],
          duration: const Duration(seconds: 30),
        ),
      );
      final paramsClient = ClientDataEntity(
        name: nameController.text,
        age: ageController!.text == '' ? null : int.parse(ageController!.text),
        plan: planController!.text,
        procediment: procedimentController!.text,
        qtdSections: qtdSectionsController!.text == '' ? null : int.parse(qtdSectionsController!.text),
        birthData: birthDataController!.text,
        cpf: cpfController!.text,
        beauticianId: loginStore.state.user.id,
      );

      final result = await _insertClientUsecase.call(paramsClient);
      result.fold(
        (l) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          Asuka.showSnackBar(
            SnackBar(
              content:
                  const Text('Falha ao cadastrar cliente, verifique os dados e tente novamente!', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.red[900],
              duration: const Duration(seconds: 5),
            ),
          );
        },
        (r) async {
          await _insertAdressUsecase.call(
            AdressEntity(
              cep: cepController!.text,
              road: roadController!.text,
              number: numberController!.text == '' ? null : int.parse(numberController!.text),
              district: districtController!.text,
              idClient: r,
            ),
          );
          await _iInsertMeasurementsUsecase.call(
            MeasurementsEntity(
              weightInitial: weightController!.text == '' ? null : double.parse(weightController!.text.replaceAll(',', '.')),
              hipInitial: hipController!.text == '' ? null : double.parse(hipController!.text.replaceAll(',', '.')),
              waistInitial: waistController!.text == '' ? null : double.parse(waistController!.text.replaceAll(',', '.')),
              abdomenInitial: abdomenController!.text == '' ? null : double.parse(abdomenController!.text.replaceAll(',', '.')),
              height: heightController!.text == '' ? null : double.parse(heightController!.text.replaceAll(',', '.')),
              idClient: r,
            ),
          );
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          Asuka.showSnackBar(
            SnackBar(
              content: const Text('Cliente cadastrado com sucesso!', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.green[900],
              duration: const Duration(seconds: 6),
            ),
          );
          clearForm();
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      Asuka.showSnackBar(
        SnackBar(
          content: const Text('Cliente n??o cadastrado!!!', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red[900],
          duration: const Duration(seconds: 6),
        ),
      );
    }
  }

  Future<void> adressApi() async {
    final cep = cepController!.text.replaceAll('.', '').replaceAll('-', '');
    final api = await _dioService.getAdress(cep);
    roadController!.text = api['logradouro'];
    districtController!.text = api['bairro'];
  }

  Future<void> loadPlans() async {
    setLoading(true);
    final listPlans = await controllerPlan.getPlans();
    update(state.copyWith(listPlans: listPlans));
    setLoading(false);
  }
}
