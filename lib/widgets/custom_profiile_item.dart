import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class CustomProfiileItem extends StatelessWidget {
  const CustomProfiileItem({
    super.key,
    required this.leading,
    required this.titel,
    required this.trailing,
  });
  final Icon leading;
  final String titel;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: leading,
        title: Text(
          titel,
          style: const TextStyle(
            fontSize: 22,
            color: kN22,
            fontFamily: 'Poppins',
          ),
        ),
        trailing: trailing,
      ),
    );
  }
}
