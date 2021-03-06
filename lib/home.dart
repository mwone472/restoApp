import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:restoapp/pages/product_screen.dart';
import 'package:restoapp/pages/setting_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        ProductScreen(),
        // ProductPage(),
        SettingScreen(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

// CHANGE THE BOTTOM NAVIGATION BAR
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.orange[400],
        title: Text(
          'BonCoin',
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
              color: Colors.teal[600]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: buildPageView()),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10).add(EdgeInsets.only(top: 5)),
            child: GNav(
                gap: 10,
                activeColor: Colors.white,
                color: Colors.grey[400],
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                    backgroundColor: Colors.orange[400],
                  ),
                  // GButton(
                  //   icon: Icons.whatshot,
                  //   text: 'Hot',
                  //   backgroundColor: Colors.red,
                  // ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                    backgroundColor: Color(0xfffbb448),
                  ),
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    pageController.jumpToPage(index);
                  });
                }),
          ),
        ),
      ),
    );
  }
}
