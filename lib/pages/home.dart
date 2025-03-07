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
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DrawerList(),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        // List navigation destination and their icons
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
          child: Text("Go to Settings"),
        ),
      ),
    );
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
          leading: Icon(Icons.home), // widget left of the title
          trailing: Icon(Icons.arrow_forward), // widget right of the title
          title: Text("Home"),
          enabled: true,
          onTap: () {
            // action when the item is tapped
            Navigator.pop(context); // Close the drawer on tap
            Navigator.pushNamed(context, '/home'); // Navigate to the home page
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          trailing: Icon(Icons.arrow_forward),
          title: Text("Settings"),
          enabled: true,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/settings');
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_mail),
          trailing: Icon(Icons.arrow_forward),
          title: Text("Contact"),
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
