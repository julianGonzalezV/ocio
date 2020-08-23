import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ItemListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        itemCount: 1,
        itemHeight: 430.0,
        itemWidth: 500.0,
        layout: SwiperLayout.TINDER,
        itemBuilder: (BuildContext context, int index) {
          return PageView(
            children: <Widget>[_cardRecomendadosSwiper()],
          );
        },
      ),
    );
  }

  Widget _cardRecomendadosSwiper() {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageProduct(),
          Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                'Chuleta valluna grande',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              )),
          _starts(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _botonActivado(),
              _botonDesactivado('Grande', '34.000'),
              _botonDesactivado('Grande', '34.000')
            ],
          ),
          _botonAdd(),
          _botonAddCar()
        ],
      ),
    );
  }

  Widget _imageProduct() {
    return Container(
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.white, blurRadius: 2.5, spreadRadius: 1.0)
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/imgs/recomendada.jpg'),
          width: double.infinity,
          height: 200.0,
        ),
      ),
    );
  }

  Widget _starts() {
    return Row(
      children: <Widget>[
        Icon(Icons.star, color: Colors.red, size: 18.0),
        Icon(Icons.star, color: Colors.red, size: 18.0),
        Icon(Icons.star, color: Colors.red, size: 18.0),
        Icon(Icons.star, color: Colors.red, size: 18.0),
        Icon(Icons.star, color: Colors.grey, size: 18.0)
      ],
    );
  }

  Widget _botonAdd() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color.fromRGBO(248, 248, 248, 1.0)),
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      child: Text('Personaliza y añade',
          style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontFamily: 'SF-Pro-Text_Bold')),
    );
  }

  Widget _botonAddCar() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: Colors.red),
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      child: Text('Añadir al carrito',
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontFamily: 'SF-Pro-Text_Bold')),
    );
  }

  Widget _botonActivado() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.red, spreadRadius: 1.0)
          ]),
      child: Row(
        children: [
          Text('Mediana', style: TextStyle(color: Colors.red, fontSize: 10.0)),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text('13.000',
                style: TextStyle(color: Colors.black, fontSize: 10.0)),
          )
        ],
      ),
    );
  }

  Widget _botonDesactivado(String size, String price) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.grey, spreadRadius: 1.0)
          ]),
      child: Row(
        children: [
          Text(size, style: TextStyle(color: Colors.grey, fontSize: 10.0)),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(price,
                style: TextStyle(color: Colors.grey, fontSize: 10.0)),
          )
        ],
      ),
    );
  }
}
