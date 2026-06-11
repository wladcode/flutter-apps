import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String? subTitle;
  final String link;
  final String routeName;
  final List<MenuItem>? children;

  const MenuItem({
    required this.title,
    required this.icon,
    this.subTitle,
    required this.link,
    required this.routeName,
    this.children,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Home',
    icon: Icons.home,
    link: '/',
    routeName: 'home_screen',
  ),
  MenuItem(
    title: 'Buttons',
    icon: Icons.radio_button_checked,
    link: '/buttons',
    routeName: 'buttons_screen',
  ),
  MenuItem(
    title: 'Cards',
    icon: Icons.credit_card,
    link: '/cards',
    routeName: 'cards_screen',
  ),
  MenuItem(
    title: 'Animated',
    icon: Icons.animation,
    link: '/animated',
    routeName: 'animated_screen',
  ),
  MenuItem(
    title: 'Tutorial',
    icon: Icons.school,
    link: '/tutorial',
    routeName: 'tutorial_screen',
  ),
  MenuItem(
    title: 'Infinite Scroll',
    icon: Icons.abc_outlined,
    link: '/infinite-scroll',
    routeName: 'infinite_scroll_screen',
  ),
  MenuItem(
    title: 'Progress',
    icon: Icons.timer,
    link: '/progress',
    routeName: 'progress_screen',
  ),
  MenuItem(
    title: 'Snackbar',
    icon: Icons.message,
    link: '/snackbar',
    routeName: 'snackbar_screen',
  ),
  MenuItem(
    title: 'Ui Controls',
    icon: Icons.settings,
    link: '/ui-controls',
    routeName: 'ui_controls_screen',
  ),
];
