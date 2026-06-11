import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

typedef AppScreenBuilder = Widget Function();

final Map<String, AppScreenBuilder> _screenBuilders = {
  HomeScreen.name: () => const HomeScreen(),
  ButtonsScreen.name: () => const ButtonsScreen(),
  CardScreen.name: () => const CardScreen(),
  AnimatedScreen.name: () => const AnimatedScreen(),
  TutorialScreen.name: () => const TutorialScreen(),
  InfiniteScrollScreen.name: () => const InfiniteScrollScreen(),
  ProgressScreen.name: () => const ProgressScreen(),
  SnackbarScreen.name: () => const SnackbarScreen(),
  UiControlsScreen.name: () => const UiControlsScreen(),
};

List<GoRoute> _buildRoutesFromMenu(List<MenuItem> items) {
  return items.map((item) {
    final builder = _screenBuilders[item.routeName];

    if (builder == null) {
      throw Exception('No screen registered for route: ${item.routeName}');
    }

    return GoRoute(
      path: item.link,
      name: item.routeName,
      builder: (context, state) => builder(),
    );
  }).toList();
}

final appRouter = GoRouter(
  initialLocation: '/',
  routes: _buildRoutesFromMenu(appMenuItems),
);
