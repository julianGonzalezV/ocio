import 'package:flutter/material.dart';
import 'package:ocio/src/model/ itemIngredient.dart';

@immutable
class Ingredient {
  final int id;
  final String name;
  final List<ItemIngredient> listItemIngredients;

  Ingredient(this.id, this.name, this.listItemIngredients);

  @override
  String toString() {
    return '{id:$id,id_item:$name}';
  }
}
