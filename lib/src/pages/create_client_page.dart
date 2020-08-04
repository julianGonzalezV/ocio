import 'package:flutter/material.dart';
import 'package:ocio/src/bloc/provider.dart';
import 'package:ocio/src/providers/client_provider.dart';

class CreateClientPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateClientState();
}

class CreateClientState extends State<CreateClientPage> {
  final clientProvider = new ClientProvider();
  String _idNumber = '';
  String _gender = '';
  String _name1 = '';
  String _name2 = '';
  String _lastName1 = '';
  String _lastName2 = '';
  String _address = '';
  String _birthdate = DateTime.now().toString();
  String _cellphone = '';

  List<String> _idTypeList = ['C', 'P', 'E'];
  List<String> _genderList = ['', 'F', 'M'];
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
        labelText: 'Email de contacto',
        suffixIcon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() {
          //_email = value;
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
          //_password = value;
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
        print('context es $context');
        FocusScope.of(context).requestFocus(new FocusScopeNode());
        _dateSelect(context);
      },
    );
  }

  List<DropdownMenuItem<String>> getListado(List<String> list) {
    List<DropdownMenuItem<String>> resultList = new List();
    list.forEach((e) {
      resultList.add(DropdownMenuItem(
        value: e,
        child: Text(e),
      ));
    });
    return resultList;
  }

  Widget _dropDownInput(String inputText, List<String> inputL,
      String inputValue, ValueChanged<String> onChangedF) {
    return Row(
      children: <Widget>[
        Text(inputText),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: DropdownButton(
            value: inputValue,
            items: getListado(inputL),
            onChanged: onChangedF,
          ),
        ),
      ],
    );
  }

  _dateSelect(BuildContext context) async {
    print('_dateSelect');
    DateTime seleccion = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );
    print('Selecciono $seleccion');
    if (seleccion != null) {
      print('va a seleccionar');
      setState(() {
        _birthdate = seleccion.toString();
        _inputFechaCtr.text = _birthdate;
      });
    }
  }

  Widget _createClient(LoginBloc bloc) {
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
      onPressed: () => _createClientOnPressed(bloc),
    );
  }

  /// Create client action
  _createClientOnPressed(LoginBloc bloc) async {
    Navigator.pushNamed(context, 'itemSummary');
    /*Client client = new Client(
        _idType,
        _idNumber,
        _gender,
        _name1,
        _name2,
        _lastName1,
        _lastName2,
        _birthdate,
        Contact(_address, _cellphone, bloc.emailValue));

    Map<String, dynamic> info = await clientProvider.createClient(client);

    if (info['ok']) {
      print('Created user ${info['clientId']}');
    } else {
      print('_loginOnPressed ${info['message']}');
      showAlert(context, info['message']);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro (Te lo preguntaremos solo una vez)'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
        children: <Widget>[
          _dropDownInput('Género', _genderList, _gender, (value) {
            setState(() {
              _gender = value;
            });
          }),
          Divider(),
          _dropDownInput('Tipo Identificación', _idTypeList, _idType, (value) {
            setState(() {
              _idType = value;
            });
          }),
          Divider(),
          _input('No Identificación', 'No Identificación', (value) {
            setState(() {
              _idNumber = value;
            });
          }),
          Divider(),
          _input('Primer nombre', 'Primer nombre', (value) {
            setState(() {
              _name1 = value;
            });
          }),
          Divider(),
          _input('Segundo nombre', 'Segundo nombre', (value) {
            setState(() {
              _name2 = value;
            });
          }),
          Divider(),
          _input('Primer apellido', 'Primer apellido', (value) {
            setState(() {
              _lastName1 = value;
            });
          }),
          Divider(),
          _input('Segundo apellido', 'Segundo Apellido', (value) {
            setState(() {
              _lastName2 = value;
            });
          }),
          Divider(),
          _fechaInput(context),
          Divider(),
          _input('celular', 'Número celular', (value) {
            setState(() {
              _cellphone = value;
            });
          }),
          Divider(),
          _input('direccion', 'Dirección', (value) {
            setState(() {
              _address = value;
            });
          }),
          Divider(),
          _createClient(bloc),
          Divider(),
          RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
              child: Text('Registrar'),
            ),
            onPressed: () => Navigator.pushNamed(context, 'welcome'),
          ),
          Divider(),
          RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
              child: Text('Home'),
            ),
            onPressed: () => Navigator.pushNamed(context, 'home'),
          ),
        ],
      ),
    );
  }
}
