import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/features/clients/presenter/widgets/text_title_client_custom.dart';
import '../../../core/utils/const/strings_colors.dart';
import 'stores/clients_store.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: StringColors.pinkClear,
              height: width * 0.015,
              width: double.maxFinite,
            ),
            // DataTable(
            //   columns: const [
            //     DataColumn(
            //       label: Text(
            //         'Nome',
            //       ),
            //     ),
            //     DataColumn(
            //       label: Text(
            //         'CPF',
            //       ),
            //     ),
            //     DataColumn(
            //       label: Text(
            //         'Data de Nascimento',
            //       ),
            //     ),
            //     DataColumn(
            //       label: Text(
            //         'Idade',
            //       ),
            //     ),
            //     DataColumn(
            //       label: Text(
            //         'Pacote',
            //       ),
            //     ),
            //     DataColumn(
            //       label: Text(
            //         'Procedimento',
            //       ),
            //     ),
            //     DataColumn(
            //       label: Text(
            //         'Sessões',
            //       ),
            //     ),
            //     DataColumn(
            //       label: Text(
            //         'Peso Inicial',
            //       ),
            //     ),
            //     DataColumn(
            //       label: Text(
            //         'Quadril inicial',
            //       ),
            //     ),
            //     DataColumn(
            //       label: Text(
            //         'Cintura inicial',
            //       ),
            //     ),
            //     DataColumn(
            //       label: Text(
            //         'Abdômen inicial',
            //       ),
            //     ),
            //   ],
            //   rows: List.generate(
            //     clientsStore.state.listClients.length,
            //     (index) => DataRow(
            //       cells: [
            //         DataCell(
            //           Text(clientsStore.state.listClients[index].name),
            //         ),
            //         DataCell(
            //           Text(clientsStore.state.listClients[index].cpf!),
            //         ),
            //         DataCell(
            //           Text(clientsStore.state.listClients[index].birthData.toString()),
            //         ),
            //         DataCell(
            //           Text(clientsStore.state.listClients[index].age.toString()),
            //         ),
            //         DataCell(
            //           Text(clientsStore.state.listClients[index].plan!),
            //         ),
            //         DataCell(
            //           Text(clientsStore.state.listClients[index].procediment!),
            //         ),
            //         DataCell(
            //           Text(clientsStore.state.listClients[index].qtdSections.toString()),
            //         ),
            //         DataCell(
            //           Text(clientsStore.state.listClients[index].currentWeight.toString()),
            //         ),
            //         DataCell(
            //           Text(clientsStore.state.listClients[index].hip.toString()),
            //         ),
            //         DataCell(
            //           Text(clientsStore.state.listClients[index].waist.toString()),
            //         ),
            //         DataCell(
            //           Text(clientsStore.state.listClients[index].abdomen.toString()),
            //         ),
            //       ],
            //     ),
            //   ),
            //   border: const TableBorder(
            //     horizontalInside: BorderSide(
            //       color: Colors.black,
            //       style: BorderStyle.solid,
            //       width: 1.0,
            //     ),
            //   ),
            // ),
            Expanded(
              child: Row(
                children: [
                  ListViewClients(
                    clientsStore: clientsStore,
                    width: width,
                  ),
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: width * 0.010, horizontal: width * 0.015),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (clientsStore.state.client != null)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dados do Cliente',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.020,
                                      ),
                                    ),
                                    SizedBox(height: width * 0.007),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        TextTitleClientCustom(
                                          width: width,
                                          text: 'Dados Pessoais',
                                          color: Colors.black,
                                        ),
                                        SizedBox(height: width * 0.007),
                                        TextClientCustom(
                                          clientsStore: clientsStore,
                                          textSubTitle: 'Nome',
                                          text: clientsStore.state.client!.name,
                                        ),
                                        if (clientsStore.state.client!.cpf != null) SizedBox(width: width * 0.020),
                                        if (clientsStore.state.client!.cpf != null)
                                          TextClientCustom(
                                            clientsStore: clientsStore,
                                            textSubTitle: 'CPF',
                                            text: '${clientsStore.state.client!.cpf}',
                                          ),
                                        if (clientsStore.state.client!.birthData != null) SizedBox(width: width * 0.020),
                                        if (clientsStore.state.client!.birthData != null)
                                          TextClientCustom(
                                            clientsStore: clientsStore,
                                            textSubTitle: 'Data de Nascimento',
                                            text: '${clientsStore.state.client!.birthData}',
                                          ),
                                        if (clientsStore.state.client!.age != null) SizedBox(width: width * 0.020),
                                        if (clientsStore.state.client!.age != null)
                                          TextClientCustom(
                                            textSubTitle: 'Idade',
                                            clientsStore: clientsStore,
                                            text: '${clientsStore.state.client!.age}',
                                          ),
                                        SizedBox(height: width * 0.007),
                                        if (!clientsStore.state.emptyPlans)
                                          TextTitleClientCustom(
                                            width: width,
                                            text: 'Serviço Contratado',
                                            color: Colors.black,
                                          ),
                                        if (clientsStore.state.client!.plan != null) SizedBox(height: width * 0.007),
                                        if (clientsStore.state.client!.plan != null)
                                          TextClientCustom(
                                            clientsStore: clientsStore,
                                            text: '${clientsStore.state.client!.plan}',
                                            textSubTitle: 'Pacote',
                                          ),
                                        if (clientsStore.state.client!.procediment != null) SizedBox(width: width * 0.020),
                                        if (clientsStore.state.client!.procediment != null)
                                          TextClientCustom(
                                            textSubTitle: 'Procedimento',
                                            clientsStore: clientsStore,
                                            text: '${clientsStore.state.client!.procediment}',
                                          ),
                                        if (clientsStore.state.client!.qtdSections != null) SizedBox(width: width * 0.020),
                                        if (clientsStore.state.client!.qtdSections != null)
                                          TextClientCustom(
                                            textSubTitle: 'Sessões',
                                            clientsStore: clientsStore,
                                            text: '${clientsStore.state.client!.qtdSections}',
                                          ),
                                        SizedBox(height: width * 0.007),
                                        if (!clientsStore.state.emptyMeasurements)
                                          TextTitleClientCustom(
                                            width: width,
                                            text: 'Medidas',
                                            color: Colors.black,
                                          ),
                                        if (clientsStore.state.client!.weight != null) SizedBox(height: width * 0.007),
                                        if (clientsStore.state.client!.weight != null)
                                          TextClientCustom(
                                            textSubTitle: 'Peso',
                                            clientsStore: clientsStore,
                                            text: '${clientsStore.state.client!.weight}',
                                          ),
                                        if (clientsStore.state.client!.hip != null)
                                          TextClientCustom(
                                            textSubTitle: 'Quadril',
                                            clientsStore: clientsStore,
                                            text: '${clientsStore.state.client!.hip}',
                                          ),
                                        if (clientsStore.state.client!.height != null) SizedBox(width: width * 0.020),
                                        if (clientsStore.state.client!.height != null)
                                          TextClientCustom(
                                            textSubTitle: 'Altura',
                                            clientsStore: clientsStore,
                                            text: '${clientsStore.state.client!.height}',
                                          ),
                                        if (clientsStore.state.client!.waist != null) SizedBox(width: width * 0.020),
                                        if (clientsStore.state.client!.waist != null)
                                          TextClientCustom(
                                            textSubTitle: 'Cintura',
                                            clientsStore: clientsStore,
                                            text: '${clientsStore.state.client!.waist}',
                                          ),
                                        if (clientsStore.state.client!.abdomen != null)
                                          TextClientCustom(
                                            textSubTitle: 'Abdômen',
                                            clientsStore: clientsStore,
                                            text: '${clientsStore.state.client!.abdomen}',
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
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
