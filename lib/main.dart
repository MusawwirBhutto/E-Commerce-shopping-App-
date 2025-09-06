import 'package:catalog_app/pages/cartpage.dart';
import 'package:catalog_app/pages/homepage.dart';
import 'package:catalog_app/pages/loginpage.dart';
import 'package:catalog_app/providers/theme_provider.dart';
import 'package:catalog_app/utilis/app_themes.dart';
import 'package:catalog_app/utilis/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            MyRoutes.homeRoute: (context) => HomePage(),
            MyRoutes.cartroute: (context) => Cartpage(),
          },
        );
      },
    );
  }
}
