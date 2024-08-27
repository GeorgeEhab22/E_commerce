import 'package:e_commerce/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_profile_view_body.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String displayName = user?.displayName ?? 'No Name';
    String email = user?.email ?? 'No Email';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: kN22,
            fontWeight: FontWeight.bold,
            fontSize: 22, // Responsive font size
          ),
        ),
      ),
      body: CustomProfileViewBody(displayName: displayName, email: email),
    );
  }
}
