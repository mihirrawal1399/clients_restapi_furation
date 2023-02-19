import 'package:clients_restapi_furation/src/clients/client_model.dart';
import 'package:flutter/material.dart';

class ClientsTab extends StatelessWidget {
  final List<Client> clients;
  final String tabName;

  const ClientsTab({super.key, required this.clients, required this.tabName});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (context, index) {
        // return ListTile(
        //   title: Text(clients[index].name),
        //   subtitle: Text(clients[index].email),
        //   trailing: Text(clients[index].phone),
        // );
        return Row(
          children: [
            Text(clients[index].id.toString()),
            Text(clients[index].name),
            Text(clients[index].age.toString()),
            Text(clients[index].spend.toString()),
            Text(clients[index].visits.toString()),
          ],
        );
      },
    );
  }
}
