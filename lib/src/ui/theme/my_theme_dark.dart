import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData get darkTheme => ThemeData(
      primaryColor: Colors.red,
      primaryColorDark: Colors.red,
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Roboto',
      indicatorColor: Colors.white12,
      appBarTheme:
          const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black38,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black38,
      ),
    );
