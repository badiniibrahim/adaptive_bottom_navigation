import 'package:adaptive_bottom_navigation/pages/adaptive_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdaptiveBottomNavigation(
        icons: const [Icons.home, Icons.search, Icons.person],
        labels: const ['Home', 'Search', 'Profile'],
        pages: const [
          Center(
            child: Text("HomePage"),
          ),
          Center(child: Text("Search")),
          Center(child: Text("Profile"))
        ],
        selectedColor: Colors.blue,
        unselectedColor: Colors.grey,
        backgroundColor: Colors.white,
        iconSize: 30.0,
        animationDuration: const Duration(milliseconds: 300),
        animationIndicatorCurve: Curves.easeIn,
        animationIconCurve: Curves.easeOut,
        indicatorDecoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        itemDecoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        bottomNavigationDecoration: const BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        height: 60.0,
        indicatorHeight: 4.0,
        indicatorSpaceBottom: 2.0,
      ),
    );
  }
}
