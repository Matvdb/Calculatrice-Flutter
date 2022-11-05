import 'package:flutter/material.dart';

class MenusItems{
  static const List<MenusItem> itemsFirst = [
    itemSettings,
  ];

  static const List<MenusItem> itemsSecond = [
    itemPartager,
  ];

  static const itemSettings = MenusItem(
    text: "Paramètre",
    icon: Icons.settings,
  );

  static const itemPartager = MenusItem(
    text: "Partager",
    icon: Icons.share,
  );
  
}

class MenusItem{
   final String text;
  final IconData icon;

  const MenusItem({
    required this.text,
    required this.icon,
  });
}