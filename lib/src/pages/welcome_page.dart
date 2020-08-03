import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[_page1(), _page2()],
      ),
    );
  }

  Widget _page1() {
    return Stack(
      children: <Widget>[_backgroundColor(), _backgroundImage(), _texts()],
    );
  }

  Widget _backgroundColor() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 198, 0.2),
    );
  }

  Widget _backgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://i.pinimg.com/236x/6e/7d/d7/6e7dd732ffdbde35855b3e8c09a916fc.jpg')),
    );
  }

  Widget _texts() {
    final textStyle = TextStyle(color: Colors.black, fontSize: 50.0);
    return Column(
      children: <Widget>[
        SafeArea(
          child: SizedBox(
            height: 25.0,
          ),
        ),
        Text('27', style: textStyle),
        Text('Lunes', style: textStyle),
        Expanded(child: Container()),
        Icon(
          Icons.keyboard_arrow_down,
          size: 70.0,
        ),
      ],
    );
  }

  Widget _page2() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 198, 0.2),
      child: Center(
        child: RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Welcome', style: TextStyle(fontSize: 22.0))),
            onPressed: () {}),
      ),
    );
  }
}
