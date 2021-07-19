import 'package:flutter/material.dart';
import 'package:movedor/components/bottom_nav.dart';
import 'package:movedor/controllers/main_controller.dart';
import 'package:movedor/screens/diary/calendar_page.dart';
import 'package:movedor/screens/infographic/infographic_screen.dart';
import 'package:movedor/screens/diary/diary_screen.dart';
import 'package:movedor/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class BookScreen extends StatefulWidget  {
  static String routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BookScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);

    Widget test () {
      if(controller.configuredDiary) {
        return CalendarPage();
      } else {
        return Diary();
      }
    }

    return Scaffold(
      // body: Body(),
      body: PageView(
          physics:new NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            Body(),
            Infographic(),
            test(),
            ProfileScreen(),
          ],
          onPageChanged: (page) {
            setState(() {
              _selectedIndex = page;
            });
          },
      ),
      bottomNavigationBar: BottomNav(_selectedIndex, _pageController)
    );
  }
}