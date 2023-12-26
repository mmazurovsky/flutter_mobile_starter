import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'auto_router/app_router.dart';

// left tab to right tab
enum NavigationTab { screen }

extension TabItemExtension on NavigationTab {
  static const Map<NavigationTab, String> _tabNameMap = {
    NavigationTab.screen: 'Screen',
  };

  static const _tabInactiveIconMap = {
    NavigationTab.screen: Icon(
      Ionicons.calendar_clear_outline,
      size: 30,
      color: Colors.blue,
    ),
  };

  static const _tabActiveIconMap = {
    NavigationTab.screen: Icon(
      Ionicons.calendar,
      size: 30,
      color: Colors.blue,
    ),
  };

  static const _tabRouteMap = {
    NavigationTab.screen: OneRoute(),
  };

  PageRouteInfo get tabRoute => _tabRouteMap[this]!;
  String get tabName => _tabNameMap[this]!;
  Widget get tabActiveIcon => _tabActiveIconMap[this]!;
  Widget get tabInactiveIcon => _tabInactiveIconMap[this]!;
}
