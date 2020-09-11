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

  final titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

  final subTitleStyle = TextStyle(fontSize: 15.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _itemImage(widget.product.image),
            _itemShortDescription(widget.product.title),
            _accountantItem(context, widget.product.price),
            //_itemActions(),
            FlatButton(
              child: Text('Pagar'),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'payment'),
            ),
            _itemDescription(),
            _itemDescription(),
            _itemDescription(),
            _itemDescription(),
            _itemDescription(),
            _itemDescription(),
            _itemDescription(),
            _itemDescription(),
            _itemDescription()
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

  Widget _accountantItem(BuildContext context, int priceProducto) {
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
        button(Icons.add_circle, changeAmountProduct, "+"),
        Column(children: <Widget>[
          Text(
            '$_amountProduct',
            style: TextStyle(fontSize: 20),
          )
        ]),
        button(Icons.do_not_disturb_on, changeAmountProduct, "-")
      ],
    );
  }

  void changeAmountProduct(String param) {
    if (_amountProduct <= 20 && _amountProduct >= 1) {
      setState(() {
        if (param == '+') {
          if (_amountProduct == 20) {
            _amountProduct = 20;
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
      });
    }
  }
}
