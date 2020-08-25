import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:ocio/src/widgets/card_recomendados.dart';
import 'package:ocio/src/styles/styles.dart';
import 'package:ocio/src/widgets/app_bar.dart';

class ItemListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return Container(
        child: Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            appBar(),
            SizedBox(
              height: 30.0,
            ),
            _recomendados(),
            _swiperRecomendados(sizeScreen),
            SizedBox(
              height: 5.0,
            ),
            _menuContainer(context),
            _gridRecomendados(context)
          ],
        ),
      )),
    ));
  }

  Widget _gridRecomendados(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'itemSummary');
            },
            child: _menuCard('Veg Pizza', 'assets/imgs/pizza2.jpg', -40.0)),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'itemSummary');
            },
            child: _menuCard('Double Pizza', 'assets/imgs/pizza3.jpg', -28.0)),
      ],
    );
  }

  Widget _menuCard(String textoEncabezdo, String ruta, double positionLeft) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              image: AssetImage(ruta),
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Transform.translate(
            offset: Offset(positionLeft, -10.0),
            child: Text(
              textoEncabezdo,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
            )),
        Transform.translate(
            offset: const Offset(-20.0, -10.0),
            child: Text(
              'A partir de 15€',
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: colorTextMuted),
            )),
      ],
    );
  }

  Widget _recomendados() {
    return Row(
      children: <Widget>[
        _recomendacion(),
        Expanded(child: Container()),
        Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Text(
              'Ver todo',
              style: TextStyle(
                  fontFamily: 'SF-Pro-Text-Bold',
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ))
      ],
    );
  }

  Widget _recomendacion() {
    return Column(
      children: <Widget>[
        Transform.translate(
            offset: const Offset(-13.0, 0.0),
            child: Text(
              'Recomendados',
              style: TextStyle(
                  fontFamily: 'SF-Pro-Text-Bold',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )),
        Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Basado en tu historial de compras',
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: colorTextMuted),
            ))
      ],
    );
  }

  Widget _swiperRecomendados(Size sizeScreen) {
    return Container(
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return PageView(
            //controller: controller,
            children: <Widget>[cardRecomendados(sizeScreen)],
          );
        },
        itemCount: 3,
        itemWidth: sizeScreen.width * 1.1,
        itemHeight: sizeScreen.height * 0.45,
        layout: SwiperLayout.TINDER,
      ),
    );
  }

  Widget _menuContainer(BuildContext context) {
    return Row(
      children: <Widget>[
        _menuText(),
        Expanded(child: Container()),
        Container(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'menu');
              },
              child: Text(
                'Ver todo',
                style: TextStyle(
                    fontFamily: 'SF-Pro-Text-Bold',
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ))
      ],
    );
  }

  Widget _menuText() {
    return Column(
      children: <Widget>[
        Transform.translate(
            offset: const Offset(-20.0, 0.0),
            child: Text(
              'Menu',
              style: TextStyle(
                  fontFamily: 'SF-Pro-Text-Bold',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )),
        Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Que hay en el menú',
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: colorTextMuted),
            ))
      ],
    );
  }
}
