import 'package:clients_restapi_furation/src/clients/client_api.dart';
import 'package:clients_restapi_furation/src/clients/client_model.dart';
import 'package:flutter/foundation.dart';

class ClientsProvider with ChangeNotifier {
  List<Client> _clients = [];

  List<Client> get clients => _clients;

  Future<void> getClients() async {
    _clients = await ClientService.getClients();
    notifyListeners();
  }

  Future<void> getClientsPaginated() async {
    _clients = await ClientService.getClientsPaginated();
    notifyListeners();
  }

  Future<void> getClientsSorted() async {
    _clients = await ClientService.getClientsSorted();
    notifyListeners();
  }

  Future<void> getClientsPagedAndSorted() async {
    _clients = await ClientService.getClientsPagedAndSorted();
    notifyListeners();
  }
}


