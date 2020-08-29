import 'package:flutter/material.dart';

@immutable
class Item {
  final String title;
  final String image;
  final String type;

  Item(this.title, this.image, this.type);

  @override
  String toString() {
    return '{image: $image, title: $title, type: $type}';
  }
}
