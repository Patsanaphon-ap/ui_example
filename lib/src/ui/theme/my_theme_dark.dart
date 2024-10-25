import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: 'Roboto',
      primaryColor: Colors.redAccent,
      primaryColorLight: Colors.white,
      primaryColorDark: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.redAccent,
        brightness: Brightness.dark,
      ),
      badgeTheme: BadgeThemeData(
        textColor: Colors.white,
        textStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.redAccent,
      ),
      scaffoldBackgroundColor: Color.fromARGB(255, 25, 25, 27),
      indicatorColor: Colors.white12,
      dividerColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.redAccent,
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: Colors.redAccent,
        labelColor: Colors.redAccent,
        unselectedLabelColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Color.fromARGB(255, 25, 25, 27),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
    );
