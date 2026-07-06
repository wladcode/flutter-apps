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
    subTitle: 'Home screen',
    icon: Icons.home,
    link: '/',
    routeName: 'home_screen',
  ),
  MenuItem(
    title: 'Buttons',
    subTitle: 'Buttons screen',
    icon: Icons.radio_button_checked,
    link: '/buttons',
    routeName: 'buttons_screen',
  ),
  MenuItem(
    title: 'Cards',
    subTitle: 'Cards screen',
    icon: Icons.credit_card,
    link: '/cards',
    routeName: 'cards_screen',
  ),

  MenuItem(
    title: 'Tutorial',
    subTitle: 'Tutorial screen',
    icon: Icons.school,
    link: '/tutorial',
    routeName: 'tutorial_screen',
  ),
  MenuItem(
    title: 'Infinite Scroll',
    subTitle: 'Infinite scroll screen',
    icon: Icons.abc_outlined,
    link: '/infinite-scroll',
    routeName: 'infinite_scroll_screen',
  ),
  MenuItem(
    title: 'Progress',
    subTitle: 'Progress indicators',
    icon: Icons.refresh_rounded,
    link: '/progress',
    routeName: 'progress_screen',
  ),
  MenuItem(
    title: 'Snackbar',
    subTitle: 'Snackbars and toasts',
    icon: Icons.message,
    link: '/snackbar',
    routeName: 'snackbar_screen',
  ),
  MenuItem(
    title: 'Ui Controls',
    subTitle: 'Buttons, checkboxes, radio buttons, etc.',
    icon: Icons.settings,
    link: '/ui-controls',
    routeName: 'ui_controls_screen',
  ),
  MenuItem(
    title: 'Animated container',
    subTitle: 'Stateful widget animado',
    icon: Icons.animation,
    link: '/animated',
    routeName: 'animated_screen',
  ),
];
