import 'package:flutter/material.dart';
import 'package:ocio/src/model/product.dart';

class ItemSummaryPage extends StatelessWidget {
  final Product product;
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
            _itemShortDescription(),
            _accountantItem(),
            _itemActions(),
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

  Widget _itemShortDescription() {
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
                    'Chuleta valluna',
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Delicioso plato valluno en el cual ...',
                    style: subTitleStyle,
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

  Widget _accountantItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _button(),
        Column(children: <Widget>[Text("1")]),
        _button()
      ],
    );
  }

  Widget _button() {
    return Column(children: <Widget>[
      IconButton(
          icon: Icon(Icons.do_not_disturb_on),
          iconSize: 40.0,
          color: Colors.purple,
          onPressed: () {})
    ]);
  }
}
