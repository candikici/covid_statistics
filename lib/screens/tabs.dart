import 'package:covid_statistics/pages/home_page.dart';
import 'package:covid_statistics/pages/news_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> pages = [
    HomePage(),
    NewsPage(),
  ];
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      backgroundColor: Color(0xFFE5E5E5),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(),
        child: SafeArea(
          bottom: true,
          left: false,
          right: false,
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
            child: GNav(
              mainAxisAlignment: MainAxisAlignment.center,
              gap: 10,
              activeColor: Colors.white,
              iconSize: 24,
              color: Colors.grey,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              tabBackgroundColor: Colors.black,
              tabs: [
                GButton(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  icon: FontAwesomeIcons.home,
                  text: 'Home Page',
                ),
                GButton(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  icon: FontAwesomeIcons.newspaper,
                  text: 'News',
                ),
              ],
              selectedIndex: pageIndex,
              onTabChange: (int index) {
                setState(() => pageIndex = index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
