import 'package:flutter/material.dart';
import '../pages/map_page/map_page.dart';
import '../pages/about_page/about_page.dart';
import '../pages/crew_page/crew_page.dart';
import '../pages/data_page/data_page.dart';
import '../pages/live_page/live_page.dart';
import '../pages/model_3d_page/model_3d_page.dart';

class Labels {
  static const map = 'Onde está agora';
  static const live = 'Ao vivo';
  static const model3d = 'Modelo 3D';
  static const crew = 'Tripulação';
  static const about = 'Sobre';
  static const data = 'Dados';
}

class AppRoute {
  final Widget page;
  final IconData icon;
  final String label;

  AppRoute({required this.page, required this.icon, required this.label});
}

final List<AppRoute> routes = [
  AppRoute(
    page: MapPage(title: Labels.map, icon: Icons.satellite_outlined),
    icon: Icons.satellite_outlined,
    label: Labels.map,
  ),
  AppRoute(
    page: LivePage(title: Labels.live, icon: Icons.live_tv),
    icon: Icons.live_tv,
    label: Labels.live,
  ),
  AppRoute(
    page: CrewPage(title: Labels.crew, icon: Icons.group),
    icon: Icons.group,
    label: Labels.crew,
  ),
  AppRoute(
    page: DataPage(title: Labels.data, icon: Icons.data_object),
    icon: Icons.data_object,
    label: Labels.data,
  ),
  AppRoute(
    page: Model3dPage(title: Labels.model3d, icon: Icons.satellite_alt),
    icon: Icons.satellite_alt,
    label: Labels.model3d,
  ),
  AppRoute(
    page: AboutPage(title: Labels.about, icon: Icons.info),
    icon: Icons.info,
    label: Labels.about,
  ),
];
