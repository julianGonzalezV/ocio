import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ocio/src/preferences/user_preferences.dart';
import 'package:ocio/src/model/client.dart';

class ClientProvider {
  /// Lo idea es que esto sea inicializado en variables de entorno
  final String _apiKey = "XXXXX";
  final String _url = "XXXXX";
  final _prefs = new UserPreferences();

  Future<Map<String, dynamic>> createClient(Client cl) async {
    final httpResp = await http.post(
      _url,
      body: json.encode(cl),
    );
    Map<String, dynamic> response = json.decode(httpResp.body);
    print(response);

    if (httpResp.statusCode == 200) {
      return {'ok': true, 'clientId': cl.idNumber};
    } else {
      return {'ok': false, 'message': response['error']['message']};
    }
  }
}
