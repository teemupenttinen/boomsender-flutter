import 'package:boomsender_flutter/routes/home.dart';
import 'package:boomsender_flutter/routes/settings.dart';
import 'package:flutter/material.dart';

class RouteItem {
  final IconData icon;
  final String label;
  final Widget screen;
  RouteItem(this.icon, this.label, this.screen);
}

final List<RouteItem> routes = <RouteItem>[
  RouteItem(Icons.home, "Home", const Home()),
  RouteItem(Icons.settings, "Settings", const Settings()),
];
