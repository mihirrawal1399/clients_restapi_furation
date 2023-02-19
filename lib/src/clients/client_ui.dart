import 'package:clients_restapi_furation/src/clients/widgets/clients_tab.dart';
import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  String tabName = 'All';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    tabName = 'All';
                  });
                  // _getClients();
                },
                child: const Text('All'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    tabName = 'Paginated';
                  });
                  // _getClients();
                },
                child: const Text('Paginated'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    tabName = 'Sorted';
                  });
                  // _getClients();
                },
                child: const Text('Sorted'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    tabName = 'Paged and Sorted';
                  });
                  // _getClients();
                },
                child: const Text('Paginated & Sorted'),
              ),
            ],
          ),
          Expanded(child: ClientsTab(tabName: tabName))
      ],
    );
  }
}