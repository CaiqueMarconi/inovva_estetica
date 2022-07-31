import 'package:flutter/material.dart';
import 'package:innova_estetica/app/features/clients/presenter/widgets/text_title_client_custom.dart';

import '../../stores/clients_store.dart';

class ListViewClients extends StatelessWidget {
  final ClientsStore clientsStore;
  final double width;

  const ListViewClients({
    Key? key,
    required this.clientsStore,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 6,
        //color: Colors.red,
        child: ListView.builder(
          itemCount: clientsStore.state.listClients.length,
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
                    clientsStore.selectClient(
                      clientsStore.state.listClients,
                      clientsStore.state.listClients[index].name,
                    );
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
                                clientsStore.state.listClients[index].name,
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
    );
  }
}
