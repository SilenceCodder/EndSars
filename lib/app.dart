import 'package:endsars/styles/AppText.dart';
import 'package:flutter/material.dart';
import 'package:endsars/Screens/DashbordScreen.dart';
import 'package:endsars/locator.dart';
import 'package:endsars/route.dart';
import 'package:endsars/services/navigation_service.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppText.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      home: DashbordScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}