import 'package:flutter/material.dart';
import 'package:itis_hub/ui/screens/courses_screen.dart';
import 'package:itis_hub/ui/screens/developers_screen.dart';
import 'package:itis_hub/ui/screens/practice_screen.dart';
import 'package:itis_hub/ui/theme/colors.dart';

class MainScreen extends StatefulWidget {
  @override
  State createState() => _MainState();
}

class _MainState extends State {
  var _currentIndex = 0;
  final List _children = [
    CoursesScreen(),
    PracticeScreen(),
    DevelopersScreen()
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: colorBackground,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabClick,
          backgroundColor: colorBackground,
          selectedItemColor: colorPrimary,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.description), label: "Курсы"),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Практика"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "О нас"),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 56.0),
          child: _children[_currentIndex],
        ),
      );

  void _onTabClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
