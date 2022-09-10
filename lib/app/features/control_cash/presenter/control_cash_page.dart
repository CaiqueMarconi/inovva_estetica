import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/core/widgets/text_form_field_custom.dart';
import 'package:innova_estetica/app/features/control_cash/presenter/stores/control_cash_store.dart';

import '../../../core/utils/const/strings_colors.dart';
import '../../clients/domain/entities/client_entity.dart';
import '../../clients/presenter/widgets/text_title_client_custom.dart';

class ControlCashPage extends StatefulWidget {
  const ControlCashPage({Key? key}) : super(key: key);

  @override
  State<ControlCashPage> createState() => _ControlCashPageState();
}

class _ControlCashPageState extends State<ControlCashPage> {
  final controlCashStore = Modular.get<ControlCashStore>();

  @override
  void initState() {
    super.initState();
    controlCashStore.getClients();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ScopedBuilder(
      store: controlCashStore,
      onState: (context, state) {
        return Column(
          children: [
            Container(
              color: StringColors.pinkClear,
              height: width * 0.015,
              width: double.maxFinite,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.010),
                      child: Column(
                        children: [
                          SizedBox(height: width * 0.030),
                          Text(
                            'Inserir Valor ao Caixa',
                            style: TextStyle(
                              color: StringColors.pinkClear,
                              fontSize: width * 0.025,
                            ),
                          ),
                          SizedBox(height: width * 0.020),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<ClientEntity>(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: StringColors.pinkClear,
                                        width: 2,
                                      ),
                                    ),
                                    focusColor: StringColors.pinkClear,
                                    labelText: 'Selecione o cliente',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  items: controlCashStore.state.listClients.map((ClientEntity dropDownStringItem) {
                                    return DropdownMenuItem<ClientEntity>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem.name),
                                    );
                                  }).toList(),
                                  onChanged: (newIten) {
                                    setState(() {
                                      controlCashStore.state.listClients.removeWhere((element) => element == newIten);
                                      controlCashStore.state.listClients.insert(0, newIten!);
                                    });
                                  },
                                  value: controlCashStore.state.listClients.first,
                                ),
                              ),
                              SizedBox(width: width * 0.010),
                              Expanded(
                                child: TextFormFieldCustom(
                                  controller: TextEditingController(),
                                  labelText: 'Descrição',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: width * 0.015),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextFormFieldCustom(
                                  controller: TextEditingController(),
                                  labelText: 'Digite o valor',
                                ),
                              ),
                              SizedBox(width: width * 0.010),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'O valor sera registrado como?',
                                      style: TextStyle(
                                        color: StringColors.pinkClear,
                                        fontSize: width * 0.010,
                                      ),
                                    ),
                                    DropdownButton<String>(
                                      items: controlCashStore.state.listInputOrOutputValue.map((String dropDownStringItem) {
                                        return DropdownMenuItem<String>(
                                          value: dropDownStringItem,
                                          child: Text(dropDownStringItem),
                                        );
                                      }).toList(),
                                      onChanged: (item) {},
                                      value: controlCashStore.state.listInputOrOutputValue.first,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: width * 0.010),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Forma de Pagamento',
                                      style: TextStyle(
                                        color: StringColors.pinkClear,
                                        fontSize: width * 0.010,
                                      ),
                                    ),
                                    DropdownButton<String>(
                                      items: controlCashStore.state.listTypePayment.map((String dropDownStringItem) {
                                        return DropdownMenuItem<String>(
                                          value: dropDownStringItem,
                                          child: Text(dropDownStringItem),
                                        );
                                      }).toList(),
                                      onChanged: (item) {},
                                      value: controlCashStore.state.listTypePayment.first,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 6,
                      //color: Colors.red,
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: controlCashStore.state.listClients.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                if (index == 0) SizedBox(height: width * 0.010),
                                if (index == 0)
                                  TextTitleClientCustom(
                                    width: width,
                                    text: 'Clientes',
                                  ),
                                if (index == 0) SizedBox(height: width * 0.010),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 0.5,
                                  height: 0.5,
                                ),
                                InkWell(
                                  onTap: () {
                                    // controlCashStore.selectClient(
                                    //   controlCashStore.state.listClients,
                                    //   controlCashStore.state.listClients[index].name,
                                    // );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 05,
                                          bottom: 05,
                                          left: 15,
                                          right: 10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                controlCashStore.state.listClients[index].name,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: width * 0.015,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}
