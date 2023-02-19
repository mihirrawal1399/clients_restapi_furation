import 'package:clients_restapi_furation/src/clients/client_model.dart';
import 'package:flutter/material.dart';

class ClientsList extends StatelessWidget {
  final List<Client> clients;
  final String tabName;

  const ClientsList({super.key, required this.clients, required this.tabName});

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
            Text('ID: ${clients[index].id}'),
            const Spacer(),
            Text('Name: ${clients[index].name}'),
            const Spacer(),
            Text('Age: ${clients[index].age}'),
            const Spacer(),
            Text('Spend: ${clients[index].spend}'),
            const Spacer(),
            Text('Visits: ${clients[index].visits}'),
          ],
        );
      },
    );
  }
}
