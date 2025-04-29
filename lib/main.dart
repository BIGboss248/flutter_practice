//* use stl shortcut to create stateless widget

import 'package:first_app/pages/contact.dart';
import 'package:first_app/pages/home.dart';
import 'package:first_app/pages/login.dart';
import 'package:first_app/pages/settings.dart';
import 'package:first_app/pages/welcome.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // Default page when the app starts
      title: "Flutter Demo", // Name shown in browser app
      debugShowCheckedModeBanner: false, // Remove the debug banner
      routes: {
        "/home": (context) => HomePage(),
        "/settings": (context) => SettingsPage(),
        "/contact": (context) => ContactPage(),
        "/login": (context) => Login(),
        "/welcome": (context) => WelcomePage(),
      },
      theme: ThemeData(
        // Theme data of the app
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 33, 243, 103),
          primary: Colors.blue,
          secondary: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
      ),
      locale: const Locale("en", "US"),
    );
  }
}
