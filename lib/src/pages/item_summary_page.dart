import 'package:flutter/material.dart';

class ItemSummaryPage extends StatelessWidget {
  final titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final subTitleStyle = TextStyle(fontSize: 15.0, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _itemImage(),
            _itemShortDescription(),
            _itemActions(),
            _itemDescription(),
            _itemDescription(),
            _itemDescription(),
            _itemDescription(),
            _itemDescription(),
            _itemDescription(),
            _itemDescription(),
            _itemDescription(),
          ],
        ),
      ),
    );
  }

  Widget _itemImage() {
    return Container(
      width: double.infinity,
      child: Image(
          image: NetworkImage(
              'https://www.elespectador.com/resizer/_gaN1rDW8MW555mRoWf4X8PR9W4=/657x0/arc-anglerfish-arc2-prod-elespectador.s3.amazonaws.com/public/KC735CGJGJCZVNLPY4L2I4K5RA.jpg')),
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
}
