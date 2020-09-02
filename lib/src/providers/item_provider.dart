import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ocio/src/model/item.dart';

class ItemProvider {
  final String _apiKey = "";
  final String _url =
      "https://23j9ok8564.execute-api.us-east-1.amazonaws.com/qa/clients";
  final String _searchByEmailUrl = "/email/";

  final String _urlTest = "https://jsonplaceholder.typicode.com/albums/";
  final String _searchByBusiness = "/photos";

  Future<List<dynamic>> findItem(String query) async {
    print('va a getClientBymail');
    final httpResp = await http.get(
      '$_url$_searchByEmailUrl$query',
    );

    final loadResponse = await rootBundle.loadString('data/items.json');
    Map dataMap = json.decode(loadResponse);
    //print('Map $dataMap');
    return dataMap['items'];
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
