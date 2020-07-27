import 'package:flutter/material.dart';
import 'package:ocio/src/pages/create_user.dart';
import 'package:ocio/src/pages/home_page.dart';
import 'package:ocio/src/pages/login_page.dart';

Map<String, WidgetBuilder> appRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'home': (BuildContext context) => HomePage(),
    'login': (BuildContext context) => LoginPage(),
    'createUser': (BuildContext context) => CreateUserPage(),
  };
}
