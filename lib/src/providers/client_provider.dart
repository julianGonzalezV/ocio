import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ocio/src/preferences/user_preferences.dart';
import 'package:ocio/src/model/client.dart';

class ClientProvider {
  /// Lo idea es que esto sea inicializado en variables de entorno
  final String _apiKey = "XXXXX";
  final String _url =
      "https://23j9ok8564.execute-api.us-east-1.amazonaws.com/qa/clients";
  final _prefs = new UserPreferences();

  Future<Map<String, dynamic>> createClient(Client cl) async {
    print('va a crear cliente');
    final httpResp = await http.post(
      _url,
      body: json.encode(_clientToJson(cl)),
    );
    /*Map<String, dynamic> response = json.decode(httpResp.body);
    print(response);*/

    if (httpResp.statusCode == 201) {
      return {'ok': true, 'clientId': cl.idNumber};
    } else {
      return {'ok': false, 'message': 'Errorrrr'};
    }
  }

  Map<String, dynamic> _clientToJson(Client cl) {
    return {
      'idNumber': cl.idNumber,
      'idType': cl.idType,
      'gender': cl.gender,
      'firstName': cl.firstName,
      'secondName': cl.secondName,
      'firstLastName': cl.firstLastName,
      'secondLastName': cl.secondLastName,
      'birthdate': cl.birthdate,
      'contact': {
        'email': cl?.contact?.email,
        'cellphone': cl?.contact?.cellphone,
        'address': cl?.contact?.address,
      },
    };
  }
}
