import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:presentation/src/config/route_page.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/ui/theme/my_theme_dark.dart';
import 'package:presentation/src/ui/theme/my_theme_light.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Presentation',
        initialRoute: RoutePath.bottomnav, //default start page
        getPages: RoutePages.routes,
        unknownRoute: RoutePages.routes[0],
        transitionDuration: const Duration(milliseconds: 400),
        defaultTransition: Transition.rightToLeft,
        builder: (context, child) {
          return child!;
        },
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system);
  }
}
