//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ocio/src/model/product.dart';
import 'package:ocio/src/widgets/buttons.dart';

class ItemSummaryPage extends StatefulWidget {
  final Product product;

  ItemSummaryPage(this.product) {}

  @override
  _ItemSummaryPageState createState() => _ItemSummaryPageState();
}

class _ItemSummaryPageState extends State<ItemSummaryPage> {
  int _amountProduct = 1;
  double _totalPriceProduct = 0;
  String _descriptionOrder = '';

  final titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

  final subTitleStyle = TextStyle(fontSize: 15.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    //_totalPriceProduct = widget.product.price;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _itemImage(widget.product.image),
            _itemShortDescription(widget.product.title),
            _accountantItem(widget.product.price),
            _createTextArea('Notas', 4),
            _createTotal(),
            Divider(),
            _buttonAdd(),
            /*FlatButton(
              child: Text('Pagar'),
              color: Colors.red,
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'payment'),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _itemImage(String image) {
    return Container(
      width: double.infinity,
      child: Image(image: NetworkImage(image)),
    );
  }

  Widget _itemShortDescription(String name) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
            ),
            Icon(
              Icons.star,
              size: 40.0,
              color: Colors.orange,
            ),
            Text('41', style: subTitleStyle)
          ],
        ),
      ),
    );
  }

  Widget _itemActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _itemAction(Icons.attach_money, 'comprar'),
        _itemAction(Icons.access_time, 'Tiempo'),
        _itemAction(Icons.share, 'Compartelo')
      ],
    );
  }

  Widget _itemAction(
    IconData iconData,
    String text,
  ) {
    return Column(
      children: <Widget>[
        Icon(iconData, color: Colors.purple),
        SizedBox(height: 5.0),
        Text(text, style: TextStyle(fontSize: 15.0, color: Colors.purple)),
      ],
    );
  }

  Widget _itemDescription() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Text(
          'blalalablalalablalalablalalablalalablalalablalblalalablalalablalalablalalablalalablalalablalalablalalablalalablalalablalalablalalablalalablalalablalalablalalaalablalala',
          textAlign: TextAlign.justify,
        ));
  }

  Widget _accountantItem(double priceProducto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: [
            Text(
              '\u0024 $priceProducto',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            )
          ],
        ),
        buttonIcon(Icons.add_circle, changeAmountProduct, "+"),
        Column(children: <Widget>[
          Text(
            '$_amountProduct',
            style: TextStyle(fontSize: 20),
          )
        ]),
        buttonIcon(Icons.do_not_disturb_on, changeAmountProduct, "-")
      ],
    );
  }

  void changeAmountProduct(String param) {
    if (_amountProduct <= 20 && _amountProduct >= 1) {
      setState(() {
        if (param == '+') {
          if (_amountProduct == 20) {
            _amountProduct = 20;
            _totalPriceProduct = widget.product.price * _amountProduct;
          } else {
            _amountProduct++;
          }
        } else {
          if (_amountProduct == 1) {
            _amountProduct = 1;
          } else {
            _amountProduct--;
          }
        }
        _totalPriceProduct = widget.product.price * _amountProduct;
      });
    }
  }

  Widget _createTextArea(String label, int maxlines) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: TextField(
          maxLines: maxlines,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              labelText: label),
          onChanged: (valor) {
            setState(() {
              // _descriptionOrder = valor;
            });
          },
        ));
  }

  Widget _createTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: [
            Text(
              'Total',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            )
          ],
        ),
        Column(children: <Widget>[
          Text(
            '\u0024 $_totalPriceProduct',
            style: TextStyle(fontSize: 20),
          )
        ]),
      ],
    );
  }

  Widget _buttonAdd() {
    return FlatButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 130.0, vertical: 10.0),
          child: Text('Agregar'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: addProducts);
  }

  void addProducts() {}
}
