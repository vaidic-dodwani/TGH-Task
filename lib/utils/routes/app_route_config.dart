import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tgh_task/view/screens/homescreen/homescreen.dart';
import 'app_route_names.dart';

class GoRouterConfig {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: AppRouteNames.splashScreenRoute,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomeScreen());
        },
      ),
    ],
  );
}
