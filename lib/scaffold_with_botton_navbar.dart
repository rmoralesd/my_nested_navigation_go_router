import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:my_nested_navigation_go_router/a_location.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key}) : super(key: key);

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  final _routerDelegates = [
    BeamerDelegate(
      initialPath: '/a',
      locationBuilder: (routerInformation, beamParameters) {
        if (routerInformation.location!.contains('/a')) {
          return ALocation(routerInformation);
        }
        return NotFound(path: routerInformation.location!);
      },
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: 0,
        children: [
          Beamer(routerDelegate: _routerDelegates[0]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Section A'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Section B')
        ],
        onTap: (value) {},
      ),
    );
  }
}
