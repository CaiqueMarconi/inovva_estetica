import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:innova_estetica/app/features/clients/stores/clients_store.dart';

import '../../../core/utils/const/strings_colors.dart';

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
                  Expanded(
                    child: ListView.builder(
                      itemCount: clientsStore.state.listClients.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            if (index == 0) SizedBox(height: width * 0.010),
                            if (index == 0)
                              Text(
                                'Clientes',
                                style: TextStyle(
                                  color: StringColors.pinkClear,
                                  fontSize: width * 0.020,
                                ),
                              ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 0.5,
                              height: 0.5,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 05),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          clientsStore.state.listClients[index].name,
                                          style: TextStyle(
                                            fontSize: width * 0.010,
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
                  const VerticalDivider(
                    color: Colors.grey,
                  ),
                  Expanded(child: Container()),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
