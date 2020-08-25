import 'package:flutter/material.dart';
import 'package:ocio/src/styles/styles.dart';

Widget appBar() {
  return Row(
    children: <Widget>[
      _ubicacion(),
      Expanded(child: Container()),
      Container(
          padding: EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/imgs/chica1.jpg'),
            radius: 28.0,
          ))
    ],
  );
}

Widget _ubicacion() {
  return Column(
    children: <Widget>[
      Transform.translate(
        offset: const Offset(-28.0, 0.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.location_on, color: Colors.red),
            Text(
              'Ubicación',
              style: estiloUbicacion,
            )
          ],
        ),
      ),
      Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Armenia, Colombia',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ))
    ],
  );
}
