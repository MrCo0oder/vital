import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vital/core/presentation/navigation/routes_manager.dart';

import 'core/presentation/navigation/routes.dart';
import 'core/presentation/utils/theme_manager.dart';

class MyApp extends StatelessWidget {
  // named constructor
  const MyApp._internal();

  static const MyApp _instance =
  MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          onGenerateRoute: RoutesManager.getRoute,
          initialRoute: Routes.splashRoute,
        );
      }
    );
  }
}