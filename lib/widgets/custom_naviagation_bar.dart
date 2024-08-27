import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CusotmBottomNavigationBar extends StatefulWidget {
  const CusotmBottomNavigationBar({
    super.key,
    this.onTap,
    required this.currentIndex,
  });
  final Function(int)? onTap;
  final int currentIndex;
  @override
  State<CusotmBottomNavigationBar> createState() =>
      _CusotmBottomNavigationBarState();
}

class _CusotmBottomNavigationBarState extends State<CusotmBottomNavigationBar> {
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: primaryColor,
      height: 66,
      key: bottomNavigationKey,
      index: widget.currentIndex,
      items: [
        Icon(
          (widget.currentIndex == 0) ? IconlyBold.home : IconlyLight.home,
          color: (widget.currentIndex != 0) ? Colors.white : Colors.blueGrey,
          size: (widget.currentIndex == 0) ? 32 : 24,
        ),
        Icon(
          (widget.currentIndex == 1) ? IconlyBold.search : IconlyLight.search,
          color:
              (widget.currentIndex != 1) ? Colors.white : Colors.purpleAccent,
          size: (widget.currentIndex == 1) ? 32 : 24,
        ),
        Icon(
          (widget.currentIndex == 2) ? IconlyBold.heart : IconlyLight.heart,
          color: (widget.currentIndex != 2) ? Colors.white : Colors.red,
          size: (widget.currentIndex == 2) ? 32 : 24,
        ),
        Icon(
          (widget.currentIndex == 3) ? IconlyBold.profile : IconlyLight.profile,
          color: (widget.currentIndex != 3) ? Colors.white : Colors.blue,
          size: (widget.currentIndex == 3) ? 32 : 24,
        ),
      ],
      buttonBackgroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(
        milliseconds: 400,
      ),
      onTap: widget.onTap,
      letIndexChange: (index) => true,
    );
  }
}
