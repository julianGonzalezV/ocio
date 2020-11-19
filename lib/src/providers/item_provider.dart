import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ocio/src/model/ingredient.dart';
import 'package:ocio/src/model/itemIngredient.dart';
import 'package:ocio/src/model/product.dart';

class ItemProvider {
  final String _urlBase =
      "https://deq4aub58g.execute-api.us-east-1.amazonaws.com/qa";
  final String _searchAllBusiness = "/businesses";
  final String _searchAllBusinessProducts = "/business";
  final String _searchProducts = "/products";
  final String _registerOrder = "/order";
  final String _searchByEmailUrl = "/email/";

  Future<List<dynamic>> findItem(String query) async {
    print('va a getClientBymail');
    final httpResp = await http.get(
      '$_urlBase$_searchByEmailUrl$query',
    );
  }

  Future<List<dynamic>> findAllItems() async {
    final httpResp = await http.get(
      '$_urlBase$_searchAllBusiness',
    );
    List<dynamic> response = json.decode(httpResp.body) as List;
    return response;
  }

  Future<List<dynamic>> findItemsForIdBusiness(String id) async {
    final httpResp = await http.get(
      '$_urlBase$_searchProducts$_searchAllBusinessProducts/$id',
    );
    List<dynamic> response = json.decode(httpResp.body) as List<dynamic>;
    return response;
  }

  Future<dynamic> findItemsProduct(String id) async {
    print("entreee metodoooos");
    final httpResp = await http.get(
      '$_urlBase$_searchProducts/$id',
    );
    print("descip productosss");
    print('$_urlBase$_searchProducts/$id');
    print(httpResp.body);
    print("despuesssss");
    print(json.decode(httpResp.body));
    dynamic response = json.decode(httpResp.body) as dynamic;
    return response;
  }

  Future<List<Product>> registerOrder(String id) async {
    final httpResp = await http.get(
      '$_urlBase$_registerOrder',
    );
    List<dynamic> response = json.decode(httpResp.body) as List;
    return response;
  }

  Future<List<Product>> findItemsForBusiness(String id) async {
    print(id);
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

        Product product = new Product(
            element['id'],
            element['id_item'],
            element['title'],
            element['image'],
            element['price'].toDouble(),
            ingreList);
        lista.add(product);
      }
    }
    return lista;
  }
}

final itemProvider = ItemProvider();
