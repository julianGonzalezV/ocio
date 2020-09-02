import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.20),
                  height: 600.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[],
                      ),
                      _paymentOptions(),
                      SizedBox(
                        height: 50.0,
                      ),
                      SizedBox(
                        height: 50.0,
                        width: 200,
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            color: Colors.green[500],
                            onPressed: () {},
                            child: Text('Comprar',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 55.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Total a pagar\n\$14.000',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ))
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: Image.asset("assets/img/payment2.jpg"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _paymentOptions() {
    int _value = 0;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Text(
          'Seleccione el medio de pago:',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        RadioListTile(
          title: Text('Efectivo'),
          value: null,
          groupValue: null,
          onChanged: null,
        ),
        RadioListTile(
          title: Text('Qr'),
          value: null,
          groupValue: null,
          onChanged: null,
        ),
        RadioListTile(
          title: Text('Datáfono'),
          value: null,
          groupValue: null,
          onChanged: null,
        ),
      ],
    );
  }
}
