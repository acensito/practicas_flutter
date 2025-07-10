import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    icon: Icons.smart_button_outlined,
    title: 'Botones',
    subtitle: 'Varios botones en flutter',
    link: '/buttons'),
  MenuItem(
    icon: Icons.credit_card,
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards'),
  MenuItem(
    icon: Icons.refresh_rounded,
    title: 'Progress Indicators',
    subtitle: 'Genreales y controlados',
    link: '/progress'),
  MenuItem(
    icon: Icons.info_outline,
    title: 'Snackbars y dialogos',
    subtitle: 'Indicadores en pantalla',
    link: '/snackbars',),
];
