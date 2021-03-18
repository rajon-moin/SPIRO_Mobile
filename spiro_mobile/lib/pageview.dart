import 'package:flutter/material.dart';
import 'package:spiro_mobile/pages/Account.dart';

import 'package:spiro_mobile/pages/homescreen.dart';
import 'package:spiro_mobile/pages/mycourses.dart';
import 'package:spiro_mobile/pages/search.dart';
import 'package:spiro_mobile/pages/wishlist.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = new PageController();
  int currentIndex = 0;
  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        controller: pageController,
        children: [Featured(), Search(), MyCourses(), WishList(), Account()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.redAccent),
        unselectedIconTheme: IconThemeData(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.red,
        iconSize: 26.0,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Featured"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_video), label: "My Courses"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Wishlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Account"),
        ],
      ),
    );
  }
}
