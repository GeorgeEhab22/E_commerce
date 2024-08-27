import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
      User? user = FirebaseAuth.instance.currentUser;
    String displayName = user?.displayName ?? 'No Name';
    String email = user?.email ?? 'No Email';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: width * 0.08, // Responsive font size
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05, // Responsive height
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(width * 0.03), // Responsive padding
                    child: CircleAvatar(
                      radius: width * 0.15, // Responsive radius
                      backgroundImage: const AssetImage("assets/images/Messi.jpg"),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          displayName,                       
                         style: TextStyle(
                          fontSize: width * 0.06, // Responsive font size
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: width * 0.04, // Responsive font size
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.1, // Responsive height
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03), // Responsive padding
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.blue, size: width * 0.07),
                  label: Text(
                    "Settings",
                    style: TextStyle(fontSize: width * 0.06, color: Colors.blue),
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.2),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.07, // Responsive height
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03), // Responsive padding
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.language, color: Colors.blue, size: width * 0.07),
                  label: Text(
                    "Languages",
                    style: TextStyle(fontSize: width * 0.06, color: Colors.blue),
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.2),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.07, // Responsive height
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03), // Responsive padding
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.dark_mode, color: Colors.blue, size: width * 0.07),
                  label: Text(
                    "Mode",
                    style: TextStyle(fontSize: width * 0.06, color: Colors.blue),
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.2),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
