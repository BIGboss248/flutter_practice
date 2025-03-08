import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HhomePageState();
}

class HhomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        endDrawer: Drawer(
          width: 250,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DrawerList(),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          // List navigation destination and their icons
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
          // Action to do when a destination is selected
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
            if (index == 0) {
              Navigator.pushNamed(context, '/home');
            } else if (index == 1) {
              Navigator.pushNamed(context, '/settings');
            }
          },
        ),
        body: Column(
          children: [
            Container(
              child: Center(
                child: Image.asset('images/lake.jpg',),
              ),
            )
          ],
        ));
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          trailing: Icon(Icons.home), // widget left of the title
          leading: Icon(Icons.arrow_back), // widget right of the title
          title: Center(child: Text("Home")),
          enabled: true,
          onTap: () {
            // action when the item is tapped
            Navigator.pop(context); // Close the drawer on tap
            Navigator.pushNamed(context, '/home'); // Navigate to the home page
          },
        ),
        ListTile(
          trailing: Icon(Icons.settings),
          leading: Icon(Icons.arrow_back),
          title: Center(child: Text("Settings")),
          enabled: true,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/settings');
          },
        ),
        ListTile(
          trailing: Icon(Icons.contact_mail),
          leading: Icon(Icons.arrow_back),
          title: Center(child: Text("Contact")),
          enabled: true,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/contact');
          },
        )
      ],
    );
  }
}
