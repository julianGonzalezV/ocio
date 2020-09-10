import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ocio/src/model/ingredient.dart';
import 'package:ocio/src/model/itemIngredient.dart';
import 'package:ocio/src/model/product.dart';

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
    //print('Map $dataMap');
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
    List<dynamic> result = dataMap['items'];
    List<dynamic> result2 = result
        .where((element) => element['title']
            .toString()
            .toLowerCase()
            .startsWith(query.toLowerCase()))
        .toList();
    return result2;
  }

  Future<List<Product>> findItemsForBusiness(int id) async {
    List<Product> lista = new List();
    List<Ingredient> ingreList = new List();
    List<ItemIngredient> ingreitemList = new List();
    final loadResponse = await rootBundle.loadString('data/products.json');
    Map dataMap = json.decode(loadResponse);
    for (var element in dataMap['products']) {
      if (element['id_item'] == id) {
        ingreList = new List();
        if (element['listItemIngredients'] != null) {
          ingreList = new List();
          for (var elem in element['listItemIngredients']) {
            ingreitemList = new List();
            for (var item in elem['listItemIngredients']) {
              ItemIngredient itemIngre =
                  new ItemIngredient(item['id'], item['name']);
              ingreitemList.add(itemIngre);
            }

            Ingredient ingre =
                new Ingredient(elem['id'], elem['name'], ingreitemList);
            ingreList.add(ingre);
          }
        }

        Product product = new Product(element['id'], element['id_item'],
            element['title'], element['image'], element['price'], ingreList);
        lista.add(product);
      }
    }
    return lista;
  }
}

final itemProvider = ItemProvider();
