import 'package:flutter/material.dart';
import 'package:ocio/src/model/ingredient.dart';

@immutable
class Product {
  final int id;
  final int id_item;
  final String title;
  final String image;
  final double price;
  final List<Ingredient> listItemIngredients;

  Product(this.id, this.id_item, this.title, this.image, this.price,
      this.listItemIngredients);

  @override
  String toString() {
    return '{id:$id,id_item:$id_item,: $image, title: $title, type: $price}';
  }
}
