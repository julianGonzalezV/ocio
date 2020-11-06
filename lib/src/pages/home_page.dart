import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ocio/src/delegate/searh_delegate.dart';
import 'package:ocio/src/providers/item_provider.dart';

import 'item_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Encuentra donde pedir hoy '),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: Scaffold(
        body: Stack(
          children: <Widget>[
            _items(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottonCategory(
      BuildContext context, String text, IconData icon, Color color) {
    return Container(
      height: 180.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(105, 64, 140, 0.5),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'itemList');
            },
            child: CircleAvatar(
              backgroundColor: color,
              radius: 35.0,
              child: Icon(
                icon,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 7.0,
          )
        ],
      ),
    );
  }

  Widget _categories(BuildContext context) {
    return Table(
      children: <TableRow>[
        TableRow(children: [
          _bottonCategory(
              context, 'Eventos', Icons.calendar_view_day, Colors.blue),
          _bottonCategory(context, 'Cocina', Icons.fastfood, Colors.purple)
        ]),
      ],
    );
  }

  Widget _items() {
    return FutureBuilder(
      future: itemProvider.findAllItems(),
      initialData: [],
      builder: (context, snapshot) {
        return ListView(
          children: _itemList(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _itemList(List<dynamic> listado, BuildContext context) {
    return listado
        .map((item) => Column(
              children: <Widget>[
                ListTile(
                  title: Text(item['name']),
                  subtitle: Text(item['description']),
                  leading: Image(
                    width: 100.0,
                    height: 100.0,
                    image: NetworkImage(item['image']),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ItemListPage(item['id'])));
                  },
                ),
                Divider()
              ],
            ))
        .toList();
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(105, 64, 140, 8.0),
            primaryColor: Colors.white,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
        child: BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text('Calendario'), icon: Icon(Icons.calendar_today)),
          BottomNavigationBarItem(
              title: Text('Calendario'), icon: Icon(Icons.bubble_chart)),
          BottomNavigationBarItem(
              title: Text('Calendario'),
              icon: Icon(Icons.supervised_user_circle))
        ]));
  }

  Widget _background() {
    final boxColor1 = Transform.rotate(
      angle: -pi / 4.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.0),
            gradient: LinearGradient(colors: <Color>[
              Colors.white,
              Color.fromRGBO(105, 64, 140, 8.0),
            ])),
      ),
    );

    final boxColor2 = Transform.rotate(
      angle: -pi / 4.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.0),
            gradient: LinearGradient(colors: <Color>[
              Colors.white,
              Color.fromRGBO(105, 64, 140, 8.0),
            ])),
      ),
    );

    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0, 0.4),
              end: FractionalOffset(0, 0.7),
              colors: <Color>[
            Colors.white,
            Color.fromRGBO(105, 64, 140, 8.0),
          ])),
    );

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(top: -100, right: 150, child: boxColor1),
        Positioned(top: -100, left: 230, child: boxColor2)
      ],
    );
  }

  Widget _titles() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '¿Que hay para hacer?',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('Seleccione la categoría que desea consultar:',
                style: TextStyle(color: Colors.deepPurple, fontSize: 20))
          ],
        ),
      ),
    );
  }
}
