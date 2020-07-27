import 'package:flutter/material.dart';

class CreateClientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateClientState();
}

class CreateClientState extends State<CreateClientPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';
  List<String> _listaItems = ['op1', 'op2', 'op3', 'op4'];
  String _opSelec = 'op1';

  TextEditingController _inputFechaCtr = new TextEditingController();

  Widget _input() {
    return TextField(
      //autofocus: true, para que aparezca el teclado de una
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          counter: Text('Cantidad de letras ${_name.length}'),
          hintText: 'nombre',
          labelText: 'Nombre',
          helperText: 'Ingrese su nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _emailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          hintText: 'Email',
          labelText: 'Email',
          helperText: 'Ingrese su email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
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
          helperText: 'Ingrese su password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
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
          labelText: 'Fecha',
          helperText: 'Seleccione una fecha',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_view_day)),
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
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _opSelec,
            items: getListado(),
            onChanged: (value) {
              setState(() {
                _opSelec = value;
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
        _date = seleccion.toString();
        _inputFechaCtr.text = _date;
      });
    }
  }

  Widget _createClient() {
    return ListTile(
      title: Text('Nombre es: $_name'),
      trailing: Text(_opSelec),
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
          _input(),
          Divider(),
          _emailInput(),
          Divider(),
          _passwordInput(),
          Divider(),
          _fechaInput(context),
          Divider(),
          _dropDownInput(),
          Divider(),
          _createClient(),
          Divider(),
        ],
      ),
    );
  }
}
