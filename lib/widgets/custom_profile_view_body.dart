import 'package:e_commerce/constants.dart';
import 'package:e_commerce/helpers/assets.dart';
import 'package:e_commerce/widgets/custom_profiile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomProfileViewBody extends StatelessWidget {
  const CustomProfileViewBody({
    super.key,
    required this.displayName,
    required this.email,
  });

  final String displayName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 22, // Responsive height
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
              ), // Responsive padding
              child: CircleAvatar(
                radius: 38, // Responsive radius
                backgroundImage: AssetImage("assets/images/Messi.jpg"),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  style: const TextStyle(
                      fontSize: 20, // Responsive font size
                      color: kN22,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 18, // Responsive font size
                    color: kN90,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        CustomProfileItem(
          leading: SizedBox(
            width: 32,
            child: AspectRatio(
              aspectRatio: 1,
              child: SvgPicture.asset(
                Assets.imagesEmail,
              ),
            ),
          ),
          titel: 'Email',
          trailingText: email,
        ),
        CustomProfileItem(
          leading: SizedBox(
            width: 32,
            child: AspectRatio(
              aspectRatio: 1,
              child: SvgPicture.asset(
                Assets.imagesGender,
              ),
            ),
          ),
          titel: 'Gender',
          trailingText: 'Male',
        ),
        CustomProfileItem(
          leading: SizedBox(
            width: 32,
            child: AspectRatio(
              aspectRatio: 1,
              child: SvgPicture.asset(
                Assets.imagesPhone,
              ),
            ),
          ),
          titel: 'Phone Number',
          trailingText: '010978576989',
        ),
        CustomProfileItem(
          leading: SizedBox(
            width: 32,
            child: AspectRatio(
              aspectRatio: 1,
              child: SvgPicture.asset(
                Assets.imagesPassword,
              ),
            ),
          ),
          titel: 'Change Password',
          trailingText: '................',
        ),
        const CustomProfileItem(
          leading: SizedBox(
            width: 32,
            child: AspectRatio(
              aspectRatio: 1,
              child: Icon(FontAwesomeIcons.language, color: kN40),
            ),
          ),
          titel: 'Language',
          trailingText: 'English US',
        ),
        const CustomProfileItem(
          leading: SizedBox(
            width: 32,
            child: AspectRatio(
              aspectRatio: 1,
              child: Icon(
                FontAwesomeIcons.circleHalfStroke,
                color: kN40,
              ),
            ),
          ),
          titel: 'Dark mode',
          trailingText: 'Light Mode',
        ),
      ],
    );
  }
}
