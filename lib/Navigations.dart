import 'package:e_commerce/screens/HomePage.dart';
import 'package:e_commerce/screens/favorite_screen.dart';
import 'package:e_commerce/screens/search_view.dart';
import 'package:e_commerce/widgets/custom_naviagation_bar.dart';
import 'package:flutter/material.dart';
import 'screens/myAccount.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Navigation> {
  int currentIndex = 0;
  List screens = [
    const HomePage(),
    const SearchView(),
    const FavoriteScreen(),
    const MyAccount(),
  ];
  int bottomNavigationBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: CusotmBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
      ),
    );
  }
}
