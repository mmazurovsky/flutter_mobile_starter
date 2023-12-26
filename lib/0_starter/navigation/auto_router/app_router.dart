import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../2_screens/screen_1/ui/screen_one.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OnePage, initial: true),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
