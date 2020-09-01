import 'package:flutter/material.dart';
import 'package:ocio/src/providers/item_provider.dart';

class DataSearch extends SearchDelegate {
  final ItemProvider _itemProvider = ItemProvider();
  String _selectionValue = "";

  @override
  List<Widget> buildActions(BuildContext context) {
    // appBar's Actions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          print('Clean Search text');
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Left size Icon
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // build the results
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(_selectionValue),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Suggestions when typing on the search field

    if (query.isEmpty) return Container();

    return FutureBuilder(
      future: _itemProvider.findItem(query),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return (snapshot.hasData)
            ? ListView(
                children: snapshot.data
                    .map((elem) => ListTile(
                          leading: FadeInImage(
                            placeholder: AssetImage('assets/img/no-image.jpg'),
                            image: NetworkImage(elem['image']),
                            width: 50.0,
                            fit: BoxFit.contain,
                          ),
                          title: Text(elem['title']),
                          subtitle: Text(elem['type']),
                          onTap: () {
                            // First, the search has to be closed
                            close(context, null);
                            Navigator.pushNamed(context, 'itemList',
                                arguments: elem);
                          },
                        ))
                    .toList(),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
