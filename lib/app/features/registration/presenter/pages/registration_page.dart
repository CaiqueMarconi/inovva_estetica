import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/core/utils/const/strings_colors.dart';
import 'package:innova_estetica/app/core/widgets/text_form_field_custom.dart';
import 'package:innova_estetica/app/features/registration/stores/registration_store.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final registrationStore = Modular.get<RegistrationStore>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: ScopedBuilder(
          store: registrationStore,
          onState: (context, state) {
            return Column(
              children: [
                Container(
                  color: StringColors.pinkClear,
                  height: width * 0.015,
                  width: double.maxFinite,
                ),
                SizedBox(height: width * 0.010),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.020),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Olá ${registrationStore.user.name}',
                      style: TextStyle(
                        fontSize: width * 0.018,
                        color: StringColors.pinkClear,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: width * 0.010),
                Center(
                  child: TextTitleComum(
                    width: width,
                    textTitle: 'Cadastro de Cliente\nInovva Estetica',
                  ),
                ),
                !registrationStore.state.addmeasurements
                    ? SizedBox(
                        width: width * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: width * 0.010),
                            TextTitleComum(
                              width: width,
                              textTitle: 'Dados Pessoais',
                            ),
                            SizedBox(height: width * 0.010),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextFormFieldCustom(
                                    controller: registrationStore.nameController,
                                    labelText: 'Digite o nome do Cliente',
                                  ),
                                ),
                                SizedBox(width: width * 0.010),
                                Expanded(
                                  child: TextFormFieldCustom(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CpfInputFormatter(),
                                    ],
                                    controller: registrationStore.cpfController!,
                                    labelText: 'Digite o CPF',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: width * 0.010),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFieldCustom(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      DataInputFormatter(),
                                    ],
                                    controller: registrationStore.birthDataController!,
                                    labelText: 'Data de nascimento',
                                  ),
                                ),
                                SizedBox(width: width * 0.010),
                                Expanded(
                                  child: TextFormFieldCustom(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                    ],
                                    controller: registrationStore.ageController!,
                                    labelText: 'Idade',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: width * 0.010),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextFormFieldCustom(
                                    controller: registrationStore.planController!,
                                    labelText: 'Pacote',
                                  ),
                                ),
                                SizedBox(width: width * 0.005),
                                Text(
                                  'Ou',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: width * 0.016,
                                    color: StringColors.pinkClear,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: width * 0.005),
                                Expanded(
                                  flex: 3,
                                  child: TextFormFieldCustom(
                                    controller: registrationStore.procedimentController!,
                                    labelText: 'Procedimento',
                                  ),
                                ),
                                SizedBox(width: width * 0.010),
                                Expanded(
                                  child: TextFormFieldCustom(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                    ],
                                    controller: registrationStore.qtdSectionsController!,
                                    labelText: 'Numero de Sessões',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        width: width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: width * 0.020),
                            TextTitleComum(
                              width: width,
                              textTitle: 'Medidas',
                            ),
                            SizedBox(height: width * 0.015),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFieldCustom(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      PesoInputFormatter(),
                                    ],
                                    controller: registrationStore.weightController!,
                                    labelText: 'peso inicial',
                                  ),
                                ),
                                SizedBox(width: width * 0.010),
                                Expanded(
                                  child: TextFormFieldCustom(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      PesoInputFormatter(),
                                    ],
                                    controller: registrationStore.hipController!,
                                    labelText: 'Quadril',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: width * 0.010),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFieldCustom(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      AlturaInputFormatter(),
                                    ],
                                    controller: registrationStore.heightController!,
                                    labelText: 'Altura',
                                  ),
                                ),
                                SizedBox(width: width * 0.010),
                                Expanded(
                                  child: TextFormFieldCustom(
                                    inputFormatters: <TextInputFormatter>[
                                      PesoInputFormatter(),
                                    ],
                                    controller: registrationStore.waistController!,
                                    labelText: 'Cintura',
                                  ),
                                ),
                                SizedBox(width: width * 0.010),
                                Expanded(
                                  child: TextFormFieldCustom(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      PesoInputFormatter(),
                                    ],
                                    controller: registrationStore.abdomenController!,
                                    labelText: 'Abdomen',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                SizedBox(height: width * 0.015),
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButtonCustom(
                    color: Colors.blue[900],
                    width: width,
                    text: !registrationStore.state.addmeasurements ? 'Adicionar Medidas -->' : 'Pronto',
                    function: () {
                      registrationStore.changeAddMeasurements();
                    },
                  ),
                ),
                SizedBox(height: width * 0.015),
                SizedBox(
                  width: width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextTitleComum(
                        width: width,
                        textTitle: 'Endereço',
                      ),
                      SizedBox(height: width * 0.015),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormFieldCustom(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CepInputFormatter(),
                              ],
                              controller: registrationStore.cepController!,
                              labelText: 'Cep',
                            ),
                          ),
                          SizedBox(width: width * 0.010),
                          Expanded(
                            flex: 3,
                            child: TextFormFieldCustom(
                              controller: registrationStore.districtController!,
                              labelText: 'Bairro',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: width * 0.010),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextFormFieldCustom(
                              controller: registrationStore.roadController!,
                              labelText: 'Rua',
                            ),
                          ),
                          SizedBox(width: width * 0.010),
                          Expanded(
                            child: TextFormFieldCustom(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                              ],
                              controller: registrationStore.numberController!,
                              labelText: 'Numero',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: width * 0.015),
                      Align(
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () async => await registrationStore.insertClient(context),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.green,
                                ),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(
                                    width * 0.015,
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Cadastrar',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            if (registrationStore.state.enableButton == true)
                              const Text(
                                'Digite um nome para o cliente',
                                style: TextStyle(),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: width * 0.030),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class ElevatedButtonCustom extends StatelessWidget {
  final String text;
  final Color? color;
  final Function() function;
  final double width;
  const ElevatedButtonCustom({
    Key? key,
    required this.width,
    required this.text,
    required this.function,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
        onPressed: () async {
          await function();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color ?? Colors.green),
          padding: MaterialStateProperty.all(
            EdgeInsets.all(
              width * 0.012,
            ),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}

class TextTitleComum extends StatelessWidget {
  final String textTitle;
  const TextTitleComum({
    Key? key,
    required this.width,
    required this.textTitle,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: width * 0.025,
        color: StringColors.pinkClear,
      ),
    );
  }
}
