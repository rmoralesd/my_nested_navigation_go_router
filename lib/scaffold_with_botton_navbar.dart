import 'package:flutter/material.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({super.key, required this.child});

  final Widget child;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Section - A',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Section - B',
          )
        ],
        currentIndex: 0,
        onTap: (value) {},
      ),
    );
  }
}
