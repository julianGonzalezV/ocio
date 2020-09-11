import 'package:flutter/material.dart';
import 'package:ocio/src/styles/styles.dart';

Widget button(IconData icon, Function function, String param) {
  return Column(children: <Widget>[
    IconButton(
        icon: Icon(icon),
        iconSize: 40.0,
        color: Colors.purple,
        onPressed: () {
          function(param);
        })
  ]);
}
