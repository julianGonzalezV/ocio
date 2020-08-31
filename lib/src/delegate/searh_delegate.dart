import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String _selectionValue = "";

  final suggestions = [
    "El italiano",
    "Sabores",
    "Sazon",
    "Parador paisa",
    "Guayabal Sancochos",
    "Otro 1",
    "Otro 2",
  ];

  final latestSuggestions = [
    "Aquitanía",
    "Laureles",
    "Cocorollo",
  ];

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
    final suggestedList = (query.isEmpty)
        ? latestSuggestions
        : suggestions
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
        itemCount: suggestedList.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(suggestedList[i]),
            onTap: () {
              _selectionValue = suggestedList[i];
              // Para que refresque el componenete
              showResults(context);
            },
          );
        });
  }
}
