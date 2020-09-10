import 'package:flutter/material.dart';
import 'package:ocio/src/model/product.dart';

class ItemSummaryPage extends StatelessWidget {
  final Product product;
  int _amountProduct = 1;
  final titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final subTitleStyle = TextStyle(fontSize: 15.0, color: Colors.grey);

  ItemSummaryPage(this.product) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _itemImage(product.image),
            _itemShortDescription(product.title),
            _accountantItem(context, product.price),
            //_itemActions(),
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
        _button(context, Icons.add_circle, changeAmountProduct, "+"),
        Column(children: <Widget>[
          Text(
            '$_amountProduct',
            style: TextStyle(fontSize: 20),
          )
        ]),
        _button(context, Icons.do_not_disturb_on, changeAmountProduct, "-")
      ],
    );
  }

  Widget _button(
      BuildContext context, IconData icon, Function function, String param) {
    return Column(children: <Widget>[
      IconButton(
          icon: Icon(icon),
          iconSize: 40.0,
          color: Colors.purple,
          onPressed: () {
            function(context, param);
          })
    ]);
  }

  void changeAmountProduct(BuildContext context, String param) {
    print(_amountProduct);
    print(param);
    if (_amountProduct <= 20 && _amountProduct >= 0) {
      if (param == "+") {
        _amountProduct++;
      } else {
        _amountProduct--;
      }
    }
  }
}
