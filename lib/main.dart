//* use stl shortcut to create stateless widget

import 'package:first_app/pages/contact.dart';
import 'package:first_app/pages/home.dart';
import 'package:first_app/pages/settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
        '/contact': (context) => ContactPage(),
      },
    );
  }
}
