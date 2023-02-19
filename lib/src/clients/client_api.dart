import 'dart:convert';
import 'package:clients_restapi_furation/src/clients/client_model.dart';
import 'package:http/http.dart' as http;

class ClientService {
  static const baseUrl = 'https://1eb53dec-6586-424f-9f6d-6edb4860dd5d.mock.pstmn.io';

  // static Future<List<Client>> getClientsReusable({int limit = 5, int? lastId, String? colm}) async {

  //   String type ='';
  //   if (lastId!=null && colm!=null) {
  //     type = 'sorted_paginated';
  //   } else if (colm!=null) {
  //     type =  'sorted';
  //   } else if (lastId!=null) {
  //     type = 'paginated';
  //   }

  //   final response = await http.post(
  //     Uri.parse('$baseUrl/clients/get/$type'),
  //     body: jsonEncode({
  //       'limit': limit,
  //       'last_id' : lastId,
  //       'sort_by_col' : colm,
  //     })
  //   );

  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     return List<Client>.from(jsonData.map((json) => Client.fromJson(json)));
  //   } else {
  //     throw Exception('Failed to get clients');
  //   }
  // }

  static Future<List<Client>> getClients({int limit = 5,}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/clients/get/'),
      body: jsonEncode({
        'limit': limit,
      })
    );
    if (response.statusCode == 200) {
      final jsonData= json.decode(response.body);
      print(response.body);
      print(jsonData);
      return List<Client>.from(jsonData['clients'].map((json) => Client.fromJson(json)));
    } else {
      throw Exception('Failed to get clients');
    }
  }

  static Future<List<Client>> getClientsPaginated({int limit = 5, int lastId = 5}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/clients/get/paginated'),
      body: jsonEncode({
        'limit': limit,
        'last_id' : lastId,
      })
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(response.body);
      print(jsonData);
      return List<Client>.from(jsonData['clients'].map((json) => Client.fromJson(json)));
    } else {
      throw Exception('Failed to get clients');
    }
  }

  static Future<List<Client>> getClientsSorted({int limit = 5, String colm = 'spend'}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/clients/get/sorted'),
      body: jsonEncode({
        'limit': limit,
        'sort_by_col' : colm,
      })
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(response.body);
      print(jsonData);
      return List<Client>.from(jsonData['clients'].map((json) => Client.fromJson(json)));
    } else {
      throw Exception('Failed to get clients');
    }
  }

  static Future<List<Client>> getClientsPagedAndSorted({int limit = 5, String colm = 'spend', String order = 'desc', int lastId = 19}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/clients/get/sorted_paginated'),
      body: jsonEncode({
        'limit': limit,
        'sort_by_col' : colm,
        'sort_order' : order,
        'last_id' : lastId,
      })
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(response.body);
      print(jsonData);
      return List<Client>.from(jsonData['clients'].map((json) => Client.fromJson(json)));
    } else {
      throw Exception('Failed to get clients');
    }
  }
}
