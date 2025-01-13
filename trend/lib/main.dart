import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/bloc_providers.dart';
import 'package:trend/utils/routes.dart';

void main() {
  runApp(
    AppBlocProviders.getBlocProviders(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          themeMode: ThemeMode.light,
          title: 'Trend',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.home,
          routes: routes, // Ensure routes are defined in utils/routes.dart
          onGenerateRoute: onGenerateRoute, // Handle dynamic routing
        );
      },
    );
  }
}
