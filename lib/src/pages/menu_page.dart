import 'package:flutter/material.dart';

//Estilos
import 'package:ocio/src/styles/styles.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              floating: false,
              pinned: true,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
              title: Text('Menu', style: estiloTitleAppBar),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: <Widget>[
                  _cardsGrid(sizeScreen, context),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ]))
          ],
        ));
  }

  Widget _cardsGrid(Size sizeScreen, BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _menuCardMenus('Veg Pizza', 'assets/imgs/pizza1.jpg', -38.0, context),
          _menuCardMenus(
              'Double Pizza', 'assets/imgs/pizza2.jpg', -28.0, context)
        ]),
        TableRow(children: [
          _menuCardMenus(
              'Cheese Pizza', 'assets/imgs/pizza3.jpg', -26.0, context),
          _menuCardMenus(
              'Hawaian Pizza', 'assets/imgs/pizza4.jpg', -23.0, context)
        ]),
        TableRow(children: [
          _menuCardMenus('Big Pizza', 'assets/imgs/pizza5.jpg', -40.0, context),
          _menuCardMenus(
              'Super Pizza', 'assets/imgs/pizza3.jpg', -33.0, context)
        ]),
        TableRow(children: [
          _menuCardMenus('Veg Pizza', 'assets/imgs/pizza2.jpg', -40.0, context),
          _menuCardMenus(
              'Double Pizza', 'assets/imgs/pizza3.jpg', -28.0, context)
        ])
      ],
    );
  }

  Widget _menuCardMenus(String textoEncabezdo, String ruta, double positionLeft,
      BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'itemSummary');
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage(
                placeholder: AssetImage(ruta),
                image: AssetImage(ruta),
                fadeInDuration: Duration(milliseconds: 100),
                fit: BoxFit.cover,
                width: 150.0,
                height: 150.0,
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
      ),
    );
  }
} //Clase
