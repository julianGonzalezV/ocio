import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ocio/src/preferences/user_preferences.dart';

class UserProvider {
  /// Lo idea es que esto sea inicializado en variables de entorno
  final String _firebaseKey = "AIzaSyAkH1JaB01WMRy1478BxXdYm6pRtKGfIvI";
  final _prefs = new UserPreferences();

  Future<Map<String, dynamic>> createUser(String email, String password) async {
    print('email $email pass $password');
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final httpResp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseKey',
      body: json.encode(authData),
    );

    Map<String, dynamic> response = json.decode(httpResp.body);
    print(response);

    if (response.containsKey('idToken')) {
      _prefs.token = response['idToken'];
      return {'ok': true, 'token': response['idToken']};
    } else {
      return {'ok': false, 'message': response['error']['message']};
    }
  }

  Future<Map<String, dynamic>> userLoggin(String email, String password) async {
    print('email $email pass $password');
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final httpResp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseKey',
      body: json.encode(authData),
    );

    Map<String, dynamic> response = json.decode(httpResp.body);
    print(response);

    if (response.containsKey('idToken')) {
      _prefs.token = response['idToken'];
      return {'ok': true, 'token': response['idToken']};
    } else {
      return {'ok': false, 'message': response['error']['message']};
    }
  }
}
