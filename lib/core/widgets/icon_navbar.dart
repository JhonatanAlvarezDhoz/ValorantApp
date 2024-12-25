import 'package:flutter/material.dart';

class IconNavBottomBar {
  String iconString;
  String? title;
  Color? color;

  IconNavBottomBar({required this.iconString, this.title, this.color});
}

List<IconNavBottomBar> iconNavBottomBar = [
  IconNavBottomBar(
    iconString: "assets/icons/agents.svg",
    title: "Agentes",
  ),
  IconNavBottomBar(
    iconString: "assets/icons/weapons.svg",
    title: "Armas",
  ),
  IconNavBottomBar(
    iconString: "assets/icons/maps.svg",
    title: "Mapas",
  )
];
