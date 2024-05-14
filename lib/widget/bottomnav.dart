import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/catogories.dart';
import 'package:wallpaper_app/pages/homepage.dart';
import 'package:wallpaper_app/pages/search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  late List<Widget> pages;
  late HomePage homePage;
  late Search search;
  late Categories categories;
  late Widget currentPage;

  @override
  void initState() {
    homePage = HomePage();
    search = Search();
    categories = Categories();
    pages = [homePage, search, categories];
    currentPage = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.black,
          height: 60,
          color: Color.fromARGB(255, 84, 87, 93),
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
            Icon(
              Icons.category,
              color: Colors.white,
            ),
          ],
        ),
        body: pages[_currentIndex]);
  }
}
