import 'package:first_app/pages/home.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Text(
            "Left side widget"), // The widget on the left side of the app bar
        automaticallyImplyLeading: true, // The back button to previous page
      ),
      // bottomNavigationBar: NavigationBar(),
      endDrawer: Drawer(
        child: DrawerList(),
      ),
      // floatingActionButton: FloatingActionButton(),
      body: Container(),
    );
  }
}
