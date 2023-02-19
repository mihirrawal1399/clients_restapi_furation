import 'package:clients_restapi_furation/src/clients/client_model.dart';
import 'package:clients_restapi_furation/src/clients/client_provider.dart';
import 'package:clients_restapi_furation/src/clients/widgets/clients_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientsTab extends StatefulWidget {
  final String tabName;
  final List<Client> clients; 

  const ClientsTab({super.key, required this.tabName, required this.clients});

  @override
  ClientsTabState createState() => ClientsTabState();
}

class ClientsTabState extends State<ClientsTab> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      switch (widget.tabName) {
        case 'All':
          Provider.of<ClientsProvider>(context, listen: false).getClients().then(
            (_) {
              setState(() {
                _isLoading = false;
              });
            },
          );
          break;
        case 'Paginated':
          Provider.of<ClientsProvider>(context, listen: false).getClientsPaginated().then((_) {
            setState(() {
              _isLoading = false;
            });
          });
          break;
        case 'Sorted':
          Provider.of<ClientsProvider>(context, listen: false).getClientsSorted().then((_) {
            setState(() {
              _isLoading = false;
            });
          });
          break;
        case 'Paged and Sorted':
          Provider.of<ClientsProvider>(context, listen: false).getClientsPagedAndSorted().then((_) {
            setState(() {
              _isLoading = false;
            });
          });
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final clients = Provider.of<ClientsProvider>(context).clients;
    // print('CLIENTS UI');
    // print(clients);

    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ClientsList(clients: widget.clients, tabName: widget.tabName);
  }
}
