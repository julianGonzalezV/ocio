import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ocio/src/model/item.dart';

class ItemProvider {
  final String _apiKey = "";
  final String _url =
      "https://23j9ok8564.execute-api.us-east-1.amazonaws.com/qa/clients";
  final String _searchByEmailUrl = "/email/";

  Future<List<Item>> findItem(String query) async {
    print('va a getClientBymail');
    final httpResp = await http.get(
      '$_url$_searchByEmailUrl$query',
    );

    final loadResponse = await rootBundle.loadString('data/listado-menu.json');
    Map dataMap = json.decode(loadResponse);
    print('Map $dataMap');
    List<Item> items = dataMap['items'];
    return items;
  }
}

final itemProvider = ItemProvider();
