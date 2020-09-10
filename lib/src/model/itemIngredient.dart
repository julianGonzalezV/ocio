import 'package:flutter/material.dart';

@immutable
class ItemIngredient {
  final int id;
  final String name;

  ItemIngredient(this.id, this.name);

  @override
  String toString() {
    return '{id:$id,id_item:$name}';
  }
}
