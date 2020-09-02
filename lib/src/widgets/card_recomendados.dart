import 'package:flutter/material.dart';

Widget cardRecomendados(Size sizeScreen) {
  return Container(
    // width: sizeScreen.width * 0.85,
    //height: sizeScreen.height * 4.45,
    padding: EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.white,
    ),
    child: ListView(
      children: <Widget>[
        _imagenPizza(),
        SizedBox(
          height: 7.0,
        ),
        Transform.translate(
            offset: const Offset(-60.0, 0.0),
            child: Text(
              'Pizza Vegana Extra Grande',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            )),
        Row(
          children: <Widget>[
            Icon(Icons.star, color: Colors.purple, size: 18.0),
            Icon(Icons.star, color: Colors.purple, size: 18.0),
            Icon(Icons.star, color: Colors.purple, size: 18.0),
            Icon(Icons.star, color: Colors.purple, size: 18.0),
            Icon(Icons.star, color: Colors.purple, size: 18.0)
          ],
        ),
        SizedBox(
          height: 7.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _botonMarcado(),
            _botonDisabled('Grande', '15€'),
            _botonDisabled('Pequeña', '10€')
          ],
        ),
        SizedBox(
          height: 7.0,
        ),
        _botonPersonaliza(),
        SizedBox(
          height: 10.0,
        ),
        _botonCarrito(),
      ],
    ),
  );
} //Clase

Widget _imagenPizza() {
  return Container(
    decoration: BoxDecoration(boxShadow: <BoxShadow>[
      BoxShadow(color: Colors.white, blurRadius: 2.5, spreadRadius: 1.0)
    ]),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image(
        image: AssetImage('assets/imgs/pizza1.jpg'),
        width: double.infinity,
        height: 170.0,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _botonMarcado() {
  return Container(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.purple, blurRadius: 0.5, spreadRadius: 0.5)
        ]),
    child: Row(
      children: <Widget>[
        Text('Mediana', style: TextStyle(fontSize: 10.0, color: Colors.purple)),
        SizedBox(
          width: 10.0,
        ),
        Text('12€', style: TextStyle(fontSize: 10.0, color: Colors.black))
      ],
    ),
  );
}

Widget _botonDisabled(String tamano, String precio) {
  return Container(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey, blurRadius: 0.5, spreadRadius: 0.5)
        ]),
    child: Row(
      children: <Widget>[
        Text(tamano, style: TextStyle(fontSize: 10.0, color: Colors.grey)),
        SizedBox(
          width: 10.0,
        ),
        Text(precio, style: TextStyle(fontSize: 10.0, color: Colors.grey))
      ],
    ),
  );
}

Widget _botonPersonaliza() {
  return Container(
    alignment: Alignment.topCenter,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Color.fromRGBO(248, 248, 248, 1.0)),
    padding: EdgeInsets.all(8.0),
    width: double.infinity,
    child: Text(
      'Personaliza y Añade',
      style: TextStyle(
        fontSize: 12.0,
        fontFamily: 'SF-Pro-Text-Bold',
      ),
    ),
  );
}

Widget _botonCarrito() {
  return Container(
    alignment: Alignment.topCenter,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), color: Colors.purple),
    padding: EdgeInsets.all(8.0),
    width: double.infinity,
    child: Text(
      'Añadir al Carrito',
      style: TextStyle(
          fontSize: 12.0, fontFamily: 'SF-Pro-Text-Bold', color: Colors.white),
    ),
  );
}
