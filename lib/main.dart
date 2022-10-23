import 'package:flutter/material.dart';
import 'package:my_nested_navigation_go_router/root_screen.dart';
import 'package:my_nested_navigation_go_router/scaffold_with_botton_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Go Router Nested Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScaffoldWithBottomNavBar(
          child: RootScreen(
        label: 'A',
        detailsPath: 'detailsPath',
      )),
    );
  }
}
