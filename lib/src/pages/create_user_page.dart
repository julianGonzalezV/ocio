import 'package:flutter/material.dart';
import 'package:ocio/src/bloc/login_bloc.dart';
import 'package:ocio/src/bloc/provider.dart';
import 'package:ocio/src/providers/user_provider.dart';
import 'package:ocio/src/util/app_message.dart';

class CreateUserPage extends StatelessWidget {
  final userProvicer = new UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _getBackground(context),
          _getLoginForm(context),
        ],
      ),
    );
  }

  Widget _getLoginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: 200.0,
          )),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Text('Crear cuenta', style: TextStyle(fontSize: 20.0)),
                SizedBox(
                  height: 50.0,
                ),
                _emailInput(bloc),
                SizedBox(height: 30.0),
                _passwordInput(bloc),
                SizedBox(height: 30.0),
                _registerButton(bloc),
              ],
            ),
          ),
          FlatButton(
            child: Text('¿Ya tienes una cuenta?'),
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
          ),
          SizedBox(height: 80.0),
        ],
      ),
    );
  }

  Widget _emailInput(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'email@mail.com',
              labelText: 'Email Address',
              icon: Icon(
                Icons.alternate_email,
                color: Colors.deepPurple,
              ),
              errorText: snapshot.error,
              counterText: snapshot.data,
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _passwordInput(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              icon: Icon(
                Icons.vpn_key,
                color: Colors.deepPurple,
              ),
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _registerButton(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
              child: Text('Crear cuenta'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.deepPurple,
            textColor: Colors.white,
            onPressed: snapshot.hasData
                ? () => _registerOnPressed(bloc, context)
                : null,
          );
        });
  }

  _registerOnPressed(LoginBloc bloc, BuildContext context) async {
    Map<String, dynamic> info =
        await userProvicer.createUser(bloc.emailValue, bloc.passwordValue);
    if (info['ok']) {
      Navigator.pop(context, 'login');
    } else {
      print('_loginOnPressed ${info['message']}');
      showAlert(context, info['message']);
    }
  }

  Widget _getBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final backgroundColor = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(125, 55, 120, 2.0),
          Color.fromRGBO(105, 64, 140, 8.0),
        ]),
      ),
    );

    final geometryStyle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(40, 20)),
        color: Color.fromRGBO(255, 255, 255, 0.1),
      ),
    );

    final loginIcon = Container(
      padding: EdgeInsets.only(top: 100.0),
      child: Column(
        children: <Widget>[
          Icon(Icons.create, color: Colors.white, size: 80.0),
          SizedBox(
            height: 8.0,
            width: double.infinity,
          ),
          Text(
            'Ocio',
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          )
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        backgroundColor,
        Positioned(child: geometryStyle, top: 90.0, left: 20.0),
        Positioned(child: geometryStyle, top: -40.0, left: -20.0),
        Positioned(child: geometryStyle, bottom: -70.0, right: -10.0),
        Positioned(child: geometryStyle, bottom: 100.0, right: 20.0),
        Positioned(child: geometryStyle, bottom: -50.0, left: -20.0),
        loginIcon,
      ],
    );
  }
}
