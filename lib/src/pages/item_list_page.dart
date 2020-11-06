import 'package:flutter/material.dart';
import 'package:ocio/src/providers/item_provider.dart';
import 'item_summary_page.dart';

class ItemListPage extends StatelessWidget {
  final String idProduct;
  ItemListPage(this.idProduct);

  @override
  Widget build(BuildContext context) {
    //final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Selecciona el plato que deseas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Scaffold(
        body: Stack(
          children: <Widget>[
            _items(idProduct),
          ],
        ),
      ),
    );
  }

  Widget _items(String id) {
    return FutureBuilder(
      future: itemProvider.findItemsForIdBusiness(id),
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
                  subtitle: Text(item['price'].toString()),
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
                            builder: (context) => ItemSummaryPage(item)));
                  },
                ),
                Divider()
              ],
            ))
        .toList();
  }
}
