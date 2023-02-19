import 'package:clients_restapi_furation/src/clients/client_provider.dart';
import 'package:flutter/material.dart';


class ClientsTab extends StatefulWidget {
  final String tabName;

  const ClientsTab({super.key, required this.tabName});

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
        ClientsProvider().getClients().then((_) {
          setState(() {
              _isLoading = false;
            });
        },);
          break;
        case 'Paginated':
          ClientsProvider().getClientsPaginated().then((_) {
            setState(() {
              _isLoading = false;
            });
          });
          break;
        case 'Sorted':
          ClientsProvider().getClientsSorted().then((_) {
            setState(() {
              _isLoading = false;
            });
          });
          break;
        case 'Paged and Sorted':
          ClientsProvider().getClientsPagedAndSorted().then((_) {
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
    // final clientsProvider = Provider.of<ClientsProvider>(context);

    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ClientsTab(tabName: widget.tabName);
  }
}
