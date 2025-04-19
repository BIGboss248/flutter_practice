import 'package:first_app/pages/home.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController nameController = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  int dropDownValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true, // The back button to previous page
      ),
      // bottomNavigationBar: NavigationBar(),
      endDrawer: Drawer(
        child: DrawerList(),
      ),
      // floatingActionButton: FloatingActionButton(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                controller:
                    nameController, // Controller to get the text from the text field
                decoration: InputDecoration(
                  labelText: "Name", // Label text when the field is focused
                  hintText:
                      "Enter your name", // Hint text when the field is empty
                  border: OutlineInputBorder(), // Border around the text field
                ),
                onEditingComplete: () {
                  //When the user presses enter (or done)
                  setState(() {});
                },
              ),
              Text(nameController.text),
              Checkbox.adaptive(
                tristate: true,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(
                    () {
                      isChecked = value;
                    },
                  );
                },
              ),
              CheckboxListTile.adaptive(
                tristate:
                    true, // If true, the checkbox will be in indeterminate state
                value:
                    isChecked, // The value of the checkbox //* Must be declared outside build method
                onChanged: (value) {
                  // What to do When the checkbox is clicked
                  setState(
                    () {
                      isChecked = value;
                    },
                  );
                },
                title: Title(
                  // Title of the checkbox
                  color: Colors.green,
                  child: Text("Checkbox"),
                ),
              ),
              Switch.adaptive(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                title: Text("Switch"),
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Slider.adaptive(
                value: sliderValue,
                onChanged: (value) {
                  setState(
                    () {
                      sliderValue = value;
                    },
                  );
                },
                min: 0,
                max: 100,
                divisions: 10,
                label: sliderValue
                    .round()
                    .toString(), // Label to show the value of the slider
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(bottom: 12),
                  color: Colors.blue,
                  child: Text(
                    "Go to Home Page",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.red,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  color: Colors.blue,
                  child: Text(
                    "Go to Home Page",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text("Go to Home Page"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text("Go to Home Page"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text("Go to Home Page"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Text("Go to Home Page")),
              ),
              CloseButton(),
              BackButton(),
              DropdownButton(
                value: dropDownValue,
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: Text("Item 1"),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text("Item 2"),
                  ),
                ],
                onChanged: (value) {
                  setState(
                    () {
                      dropDownValue = value!;
                    },
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Hello"),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: "Undo",
                        onPressed: () {},
                      ),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.all(12),
                      showCloseIcon: true,
                      closeIconColor: Colors.white,
                    ),
                  );
                },
                child: Text("Snackbar"),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Alert"),
                        content: Text("This is an alert dialog"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Open alert"),
              ),
              Divider(
                color: Colors.cyanAccent,
                height: 12,
                thickness: 2,
                indent: 12,
                endIndent: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Card",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "This is a card",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
