import 'package:flutter/material.dart';
class MenuItem {
  final String title;
  final IconData icon;
  final String? subTitle;
  final String link;
  final List<MenuItem>? children;

  const MenuItem({required this.title, required this.icon, this.subTitle, required this.link, this.children});


}

const appMenuItems = <MenuItem>[
  MenuItem(title: 'Home', icon: Icons.home, link: '/'),
  MenuItem(title: 'Settings', icon: Icons.settings, link: '/settings'),
  MenuItem(title: 'About', icon: Icons.info, link: '/about'),
  MenuItem(title: 'Buttons', icon: Icons.radio_button_checked, link: '/buttons'),
  MenuItem(title: 'Cards', icon: Icons.credit_card, link: '/cards'),
];
