import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:my_nested_navigation_go_router/beam_locations.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key}) : super(key: key);

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int _currentIndex = 0;

  final _routerDelegates = [
    BeamerDelegate(
      initialPath: '/a',
      locationBuilder: (routerInformation, beamParameters) {
        if (routerInformation.location!.contains('/a')) {
          return ALocation(routerInformation);
        }
        return NotFound(path: routerInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/b',
      locationBuilder: (routerInformation, beamParameters) {
        if (routerInformation.location!.contains('/b')) {
          return BLocation(routerInformation);
        }
        return NotFound(path: routerInformation.location!);
      },
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Beamer(
            routerDelegate: _routerDelegates[0],
          ),
          Beamer(
            routerDelegate: _routerDelegates[1],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Section A'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Section B')
        ],
        onTap: (value) {
          if (value != _currentIndex) {
            setState(() {
              _currentIndex = value;
            });
          }
        },
      ),
    );
  }
}
