import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

import 'ui/pages/home/home_page.dart';
import 'ui/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Test App',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('es'),
      ],
      initialRoute: HomePage.routeName,
      routes: AppRoutes.getAppicationRoutes,
    );
  }
}
