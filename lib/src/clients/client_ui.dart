import 'package:clients_restapi_furation/src/clients/client_provider.dart';
import 'package:clients_restapi_furation/src/clients/widgets/clients_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  
  String tabName = 'All';

  @override
  Widget build(BuildContext context) {
    // final clientsProvider = Provider.of<ClientsProvider>(context);
    // final clients = clientsProvider.clients;
    return ChangeNotifierProvider(
      create: (_) => ClientsProvider(),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ClientsProvider>(context, listen: false).getClients();
                    setState(() {
                      tabName = 'All';
                    });
                    // _getClients();
                  },
                  child: const Text('All'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ClientsProvider>(context, listen: false).getClientsPaginated();
                    setState(() {
                      tabName = 'Paginated';
                    });
                    // _getClients();
                  },
                  child: const Text('Paginated'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ClientsProvider>(context, listen: false).getClientsSorted();
                    setState(() {
                      tabName = 'Sorted';
                    });
                    // _getClients();
                  },
                  child: const Text('Sorted'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<ClientsProvider>(context, listen: false).getClientsPagedAndSorted();
                    setState(() {
                      tabName = 'Paged and Sorted';
                    });
                    // _getClients();
                  },
                  child: const Text('Paginated & Sorted'),
                ),
              ],
            ),
            Consumer<ClientsProvider>(
              builder: (context, ClientsProvider, child) {
                return Expanded(child: ClientsTab(tabName: tabName, clients: [...ClientsProvider.clients],));
              }
            )
        ],
      ),
    );
  }
}