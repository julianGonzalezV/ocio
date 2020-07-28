import 'package:flutter/material.dart';

class CreateClientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateClientState();
}

class CreateClientState extends State<CreateClientPage> {
  String _idNumber = '';
  String _names = '';
  String _lastNames = '';
  String _address = '';
  String _birthdate = '';
  String _celphone = '';
  String _email = '';

  String _password = '';

  List<String> _listaItems = ['C', 'P', 'E'];
  String _idType = 'C';

  TextEditingController _inputFechaCtr = new TextEditingController();

  Widget _input(
      String hintText, String labelText, ValueChanged<String> onChangedF) {
    return TextField(
      //autofocus: true, para que aparezca el teclado de una
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        hintText: hintText,
        labelText: labelText,
      ),
      onChanged: onChangedF,
    );
  }

  Widget _emailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _passwordInput() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
      ),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _fechaInput(BuildContext context) {
    return TextField(
      controller: _inputFechaCtr,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        hintText: 'Fecha',
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusScopeNode());
        _dateSelect(context);
      },
    );
  }

  List<DropdownMenuItem<String>> getListado() {
    List<DropdownMenuItem<String>> l1 = new List();
    _listaItems.forEach((e) {
      l1.add(DropdownMenuItem(
        value: e,
        child: Text(e),
      ));
    });
    return l1;
  }

  Widget _dropDownInput() {
    return Row(
      children: <Widget>[
        Text('Tipo identificacion'),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _idType,
            items: getListado(),
            onChanged: (value) {
              setState(() {
                _idType = value;
              });
            },
          ),
        ),
      ],
    );
  }

  _dateSelect(BuildContext context) async {
    DateTime seleccion = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );
    if (seleccion != null) {
      setState(() {
        _birthdate = seleccion.toString();
        _inputFechaCtr.text = _birthdate;
      });
    }
  }

  Widget _createClient() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
        child: Text('Registrar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
        children: <Widget>[
          _dropDownInput(),
          Divider(),
          _input('No Identificación', 'No Identificación', (value) {
            setState(() {
              _idNumber = value;
            });
          }),
          Divider(),
          _input('Nombres', 'Nombres', (value) {
            setState(() {
              _names = value;
            });
          }),
          Divider(),
          _input('Apellidos', 'Apellidos', (value) {
            setState(() {
              _lastNames = value;
            });
          }),
          Divider(),
          _fechaInput(context),
          Divider(),
          _emailInput(),
          Divider(),
          _input('celular', 'Número celular', (value) {
            setState(() {
              _celphone = value;
            });
          }),
          Divider(),
          _input('direccion', 'Dirección', (value) {
            setState(() {
              _celphone = value;
            });
          }),
          Divider(),
          _createClient(),
          Divider(),
        ],
      ),
    );
  }
}
