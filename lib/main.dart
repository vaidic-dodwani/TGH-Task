import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/provider/app_providers.dart';
import 'utils/routes/app_route_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouterConfig.router,
      ),
    );
  }
}
