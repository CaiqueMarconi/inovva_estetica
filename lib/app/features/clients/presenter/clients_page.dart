import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/features/clients/presenter/widgets/text_title_client_custom.dart';
import 'package:innova_estetica/app/features/clients/stores/clients_store.dart';

import '../../../core/utils/const/strings_colors.dart';
import 'widgets/list_view_clients.dart';
import 'widgets/text_client_custom.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  final clientsStore = Modular.get<ClientsStore>();

  @override
  void initState() {
    clientsStore.getCLients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ScopedBuilder(
      store: clientsStore,
      onState: (context, state) {
        //clientsStore.getCLients();
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
                  ListViewClients(
                    clientsStore: clientsStore,
                    width: width,
                  ),
                  // const VerticalDivider(
                  //   color: Colors.grey,
                  // ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: width * 0.010, horizontal: width * 0.015),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (clientsStore.state.client != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextTitleClientCustom(
                                  width: width,
                                  text: 'Dados Pessoais',
                                  color: Colors.black,
                                ),
                                SizedBox(height: width * 0.007),
                                Column(
                                  // runSpacing: width * 0.005,
                                  // alignment: WrapAlignment.spaceBetween,
                                  // runAlignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextClientCustom(
                                      clientsStore: clientsStore,
                                      textSubTitle: 'Nome',
                                      text: clientsStore.state.client!.name,
                                    ),
                                    if (clientsStore.state.client!.cpf != '') SizedBox(width: width * 0.020),
                                    if (clientsStore.state.client!.cpf != '')
                                      TextClientCustom(
                                        clientsStore: clientsStore,
                                        textSubTitle: 'CPF',
                                        text: '${clientsStore.state.client!.cpf}',
                                      ),
                                    SizedBox(width: width * 0.020),
                                    TextClientCustom(
                                      clientsStore: clientsStore,
                                      textSubTitle: 'Data de Nascimento',
                                      text: '${clientsStore.state.client!.birthData}',
                                    ),
                                    SizedBox(width: width * 0.020),
                                    TextClientCustom(
                                      textSubTitle: 'Idade',
                                      clientsStore: clientsStore,
                                      text: '${clientsStore.state.client!.age}',
                                    ),
                                    SizedBox(width: width * 0.020),
                                    TextClientCustom(
                                      clientsStore: clientsStore,
                                      text: '${clientsStore.state.client!.plan}',
                                      textSubTitle: 'Pacote',
                                    ),
                                    SizedBox(width: width * 0.020),
                                    TextClientCustom(
                                      textSubTitle: 'Procedimento',
                                      clientsStore: clientsStore,
                                      text: '${clientsStore.state.client!.procediment}',
                                    ),
                                    SizedBox(width: width * 0.020),
                                    TextClientCustom(
                                      textSubTitle: 'Sessões',
                                      clientsStore: clientsStore,
                                      text: '${clientsStore.state.client!.qtdSections}',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  // Expanded(child: Container()),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
