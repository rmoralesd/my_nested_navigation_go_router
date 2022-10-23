import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_nested_navigation_go_router/details_screen.dart';
import 'package:my_nested_navigation_go_router/root_screen.dart';
import 'package:my_nested_navigation_go_router/scaffold_with_botton_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ScaffoldWithNavBarTabItem(
        icon: const Icon(Icons.home),
        initialLocation: '/a',
        label: 'Section - A',
      ),
      ScaffoldWithNavBarTabItem(
        icon: const Icon(Icons.settings),
        initialLocation: '/b',
        label: 'Section - B',
      )
    ];

    final goRouter = GoRouter(
      initialLocation: '/a',
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return ScaffoldWithBottomNavBar(
                tabs: tabs,
                child: child,
              );
            },
            routes: [
              GoRoute(
                  path: '/a',
                  pageBuilder: (context, state) => NoTransitionPage(
                        key: state.pageKey,
                        child: const RootScreen(
                            label: 'A', detailsPath: '/a/details'),
                      ),
                  routes: [
                    GoRoute(
                      path: 'details',
                      builder: (context, state) => const DetailsScreen(
                        label: 'A',
                      ),
                    )
                  ]),
              GoRoute(
                  path: '/b',
                  pageBuilder: (context, state) => NoTransitionPage(
                        key: state.pageKey,
                        child: const RootScreen(
                          label: 'B',
                          detailsPath: '/b/details',
                        ),
                      ),
                  routes: [
                    GoRoute(
                      path: 'details',
                      builder: (context, state) => const DetailsScreen(
                        label: 'B',
                      ),
                    )
                  ]),
            ])
      ],
    );

    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
