import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:my_nested_navigation_go_router/details_screen.dart';
import 'package:my_nested_navigation_go_router/root_screen.dart';

class ALocation extends BeamLocation<BeamState> {
  ALocation(super.routeInformation);
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        child: RootScreen(
          label: 'A',
          detailsPath: '/a/details',
        ),
        type: BeamPageType.fadeTransition,
      ),
      if (state.uri.pathSegments.length == 2)
        const BeamPage(
          child: DetailsScreen(label: 'A'),
          type: BeamPageType.scaleTransition,
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/*'];
}

class BLocation extends BeamLocation<BeamState> {
  BLocation(super.routeInformation);
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        child: RootScreen(
          label: 'B',
          detailsPath: '/b/details',
        ),
        type: BeamPageType.fadeTransition,
      ),
      if (state.uri.pathSegments.length == 2)
        const BeamPage(
          child: DetailsScreen(label: 'B'),
          type: BeamPageType.scaleTransition,
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/*'];
}
