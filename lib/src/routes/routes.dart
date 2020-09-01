import 'package:flutter/material.dart';
import 'package:ocio/src/pages/create_client_page.dart';
import 'package:ocio/src/pages/create_user_page.dart';
import 'package:ocio/src/pages/home_page.dart';
import 'package:ocio/src/pages/item_summary_page.dart';
import 'package:ocio/src/pages/login_page.dart';
import 'package:ocio/src/pages/payment_page.dart';
import 'package:ocio/src/pages/welcome_page.dart';

Map<String, WidgetBuilder> appRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'home': (BuildContext context) => HomePage(),
    'login': (BuildContext context) => LoginPage(),
    'welcome': (BuildContext context) => WelcomePage(),
    'createUser': (BuildContext context) => CreateUserPage(),
    'createClient': (BuildContext context) => CreateClientPage(),
    'itemSummary': (BuildContext context) => ItemSummaryPage(),
    'payment': (BuildContext context) => PaymentPage(),
  };
}
