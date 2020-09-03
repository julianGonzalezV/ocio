import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PaymentState();
}

class PaymentState extends State<PaymentPage> {
  int _paySelected = 0;

  void _paymentOptionsHandler(int selectedValue) {
    print('selectedValue => ${selectedValue}');
    setState(() {
      _paySelected = selectedValue;
    });
  }

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
          subtitle: Text('Lo pagas una vez lo recibas'),
          value: 0,
          groupValue: _paySelected,
          onChanged: _paymentOptionsHandler,
          activeColor: Colors.deepPurpleAccent,
        ),
        RadioListTile(
          title: Text('Qr'),
          subtitle: Text('Lo pagas por tu app bancolombia'),
          value: 1,
          groupValue: _paySelected,
          onChanged: _paymentOptionsHandler,
          activeColor: Colors.deepPurpleAccent,
        ),
        RadioListTile(
          title: Text('Datáfono'),
          subtitle: Text('Te llevamos el datáfono, ten lista tu tarjeta'),
          value: 2,
          groupValue: _paySelected,
          onChanged: _paymentOptionsHandler,
          activeColor: Colors.deepPurpleAccent,
        ),
      ],
    );
  }
}
