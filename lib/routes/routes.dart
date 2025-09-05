import 'package:flutter/material.dart';
import '../pages/map_page/map_page.dart';
import '../pages/about_page/about_page.dart';

class Labels {
  static const ondeEstaAgora = 'Onde está agora';
  static const aoVivo = 'Ao vivo';
  static const modelo3d = 'Modelo 3D';
  static const tripulacao = 'Tripulação';
  static const sobre = 'Sobre';
  static const dados = 'Dados';
}

class AppRoute {
  final Widget page;
  final IconData icon;
  final String label;

  AppRoute({required this.page, required this.icon, required this.label});
}

final List<AppRoute> routes = [
  AppRoute(
    page: MapPage(title: Labels.ondeEstaAgora),
    icon: Icons.satellite_alt,
    label: Labels.ondeEstaAgora,
  ),
  AppRoute(
    page: AboutPage(title: Labels.aoVivo),
    icon: Icons.live_tv,
    label: Labels.aoVivo,
  ),
  AppRoute(
    page: AboutPage(title: Labels.modelo3d),
    icon: Icons.live_tv,
    label: Labels.modelo3d,
  ),
  AppRoute(
    page: AboutPage(title: Labels.tripulacao),
    icon: Icons.group,
    label: Labels.tripulacao,
  ),
  AppRoute(
    page: AboutPage(title: Labels.sobre),
    icon: Icons.info,
    label: Labels.sobre,
  ),
  AppRoute(
    page: AboutPage(title: Labels.dados),
    icon: Icons.data_object,
    label: Labels.dados,
  ),
];
