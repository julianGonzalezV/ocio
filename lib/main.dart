import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ocio/src/bloc/provider.dart';
import 'package:ocio/src/preferences/user_preferences.dart';
import 'package:ocio/src/routes/routes.dart';

void main() async {
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('es', 'ES'),
          const Locale.fromSubtags(
              languageCode: 'zh'), // Chinese *See Advanced Locales below*
          // ... other locales the app supports
        ],
        title: 'Material App',
        initialRoute: 'login',
        routes: appRoutes(),
        theme: ThemeData(primaryColor: Colors.deepPurpleAccent),
      ),
    );
  }
}
