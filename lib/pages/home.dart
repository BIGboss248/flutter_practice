import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HhomePageState();
}

class HhomePageState extends State<HomePage> {
  int currentPage = 0;
  bool isHovering = false;
  bool isSwitch = false;
  bool? isCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            spacing: 8,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: Size.fromWidth(75)),
                child: Text(
                  "Home",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: Size.fromWidth(75)),
                child: Text(
                  "Contact",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width * 0.3,
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
      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            // Center(
            //   child: Center(
            //     child: MouseRegion(
            //       onEnter: (_) {
            //         setState(() {
            //           isHovering = true;
            //         });
            //       },
            //       onExit: (_) {
            //         setState(() {
            //           isHovering = false;
            //         });
            //       },
            //       child: Stack(
            //         alignment: Alignment.center,
            //         children: [
            //           Image.asset(
            //             'images/lake.jpg',
            //             width: 1920,
            //             height: 1080,
            //             fit: BoxFit.cover,
            //           ),
            //           if (isHovering)
            //             Positioned.fill(
            //               child: Container(
            //                 color: Colors.black.withAlpha(128),
            //                 child: Padding(
            //                   padding: const EdgeInsets.fromLTRB(0, 500, 0, 0),
            //                   child: Center(
            //                     child: AnimatedOpacity(
            //                       opacity: isHovering ? 1.0 : 0.0,
            //                       duration: Duration(milliseconds: 300),
            //                       child: Text(
            //                         "Pixelprofit corp",
            //                         style: TextStyle(
            //                           color: Colors.white,
            //                           fontSize: 20,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            //* Add lottie package
            //* add lottie folder to pubspec.yaml
            //* Download lottie animation from lottiefiles.com
            Lottie.asset(
              "assets/lotties/animation.json",
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: isSwitch
                      ? const Color.fromARGB(255, 46, 45, 45)
                      : Colors.black, // Change text color with switch widget
                  backgroundColor: Colors.blue,
                  shadowColor: Colors.red,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                onPressed: () {
                  debugPrint("ElevatedButton pressed");
                },
                child: Text("Click me")),
            OutlinedButton(
                onPressed: () {
                  debugPrint("OutlinedButton pressed");
                },
                child: Text("Click me")),
            TextButton(
                onPressed: () {
                  debugPrint("TextButton pressed");
                },
                child: Text("Click me")),
            GestureDetector(
              onTap: () {
                debugPrint("Row pressed");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.local_fire_department_rounded,
                    color: Colors.amber,
                  ),
                  Text("Row widget"),
                  Icon(
                    Icons.local_fire_department_rounded,
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
            Switch(
                value: isSwitch,
                onChanged: (bool newbool) {
                  debugPrint("Switch value changed to $newbool");
                  setState(() {
                    isSwitch = newbool;
                  });
                }),
            Checkbox(
                value: isCheckbox,
                onChanged: (bool? newbool) {
                  debugPrint("Checkbox value changed to $newbool");
                  setState(() {
                    isCheckbox = newbool;
                  });
                }),
            Visibility(
              visible: isCheckbox ?? false,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAgCP4ggjblYy6md3itu-vR8l380G0GiIR4w&s",
              ),
            ),
          ],
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
        ),
        ListTile(
          title: Center(child: Text("Login")),
          enabled: true,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/login');
          },
        ),
        ListTile(
          title: Center(child: Text("Welcome")),
          enabled: true,
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/welcome');
          },
        ),
      ],
    );
  }
}
