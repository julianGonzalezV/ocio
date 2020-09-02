import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ItemProvider {
  final String _apiKey = "";
  final String _url =
      "https://23j9ok8564.execute-api.us-east-1.amazonaws.com/qa/clients";
  final String _searchByEmailUrl = "/email/";
  final String _searchAllUrl = "items/all";

  Future<List<dynamic>> findAllItems() async {
    print('va a getClientBymail');
    final httpResp = await http.get(
      '$_url$_searchAllUrl',
    );

    final loadResponse = await rootBundle.loadString('data/items.json');
    Map dataMap = json.decode(loadResponse);
    print('Map $dataMap');
    return dataMap['items'];
  }

  final String _urlTest = "https://jsonplaceholder.typicode.com/albums/";
  final String _searchByBusiness = "/photos";

  Future<List<dynamic>> findItem(String query) async {
    print('va a getClientBymail');
    final httpResp = await http.get(
      '$_url$_searchByEmailUrl$query',
    );

    final loadResponse = await rootBundle.loadString('data/items.json');
    Map dataMap = json.decode(loadResponse);
    print('Map $dataMap');
    List<dynamic> result = dataMap['items'];
    List<dynamic> result2 = result
        .where((element) => element['title']
            .toString()
            .toLowerCase()
            .startsWith(query.toLowerCase()))
        .toList();
    return result2;
  }

  Future<List<dynamic>> findItemsForBusiness(int id) async {
    print("llego parametro");
    print(id);
    final loadResponse = await rootBundle.loadString('data/products.json');
    Map dataMap = json.decode(loadResponse);
    print(dataMap);
    return dataMap['products'];
  }
}

final itemProvider = ItemProvider();
