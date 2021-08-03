import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:component/src/routes/routes.dart';
import 'package:component/src/pages/alert_page.dart';
// import 'package:component/src/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English
        Locale('es', 'ES'), // Spanish
      ],
      // home: HomePageTemp());
      // home: HomePage());
      initialRoute: '/',
      routes: getAppRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        // print('Route called: ${settings.name}');
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
