import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ocio/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      /*body: Column(
        children: <Widget>[
          Text('Email ${bloc.emailValue}'),
          Text('Password ${bloc.passwordValue} '),
        ],
      ),*/
      body: Scaffold(
        body: Stack(
          children: <Widget>[
            _background(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _titles(),
                  _categories(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  _bottonCategory(String text, IconData icon, Color color) {
    return Container(
      height: 180.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(105, 64, 140, 0.5),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: color,
            radius: 35.0,
            child: Icon(
              icon,
              color: Colors.white,
              size: 20.0,
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

  Widget _categories() {
    return Table(
      children: <TableRow>[
        TableRow(children: [
          _bottonCategory('Eventos', Icons.border_all, Colors.blue),
          _bottonCategory('Cocina', Icons.directions_bus, Colors.purple)
        ]),
        TableRow(children: [
          _bottonCategory('Centros comerciales', Icons.shop, Colors.pinkAccent),
          _bottonCategory('otro1', Icons.insert_drive_file, Colors.orange)
        ]),
        TableRow(children: [
          _bottonCategory('otro2', Icons.movie_filter, Colors.blueAccent),
          _bottonCategory('otro3', Icons.cloud, Colors.green)
        ]),
      ],
    );
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
    final boxColor = Transform.rotate(
      angle: -pi / 4.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.0),
            gradient: LinearGradient(colors: <Color>[
              Color.fromRGBO(105, 64, 140, 8.0),
              Colors.white,
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
        Positioned(top: -100, child: boxColor),
      ],
    );
  }

  Widget _titles() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '¿Que hay para hacer?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('Seleccione la categoría que desea consultar:',
                style: TextStyle(color: Colors.white, fontSize: 20))
          ],
        ),
      ),
    );
  }
}
