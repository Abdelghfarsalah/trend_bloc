import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/utils/routes.dart'; // Import your custom routes

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
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
          theme: ThemeData(
            brightness: Brightness.light,
            splashColor: Colors.white,
            highlightColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.white,
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            buttonTheme: const ButtonThemeData(
              buttonColor: Colors.white,
              textTheme: ButtonTextTheme.primary,
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            cardColor: Colors.white,
            dialogBackgroundColor: Colors.white,
            dividerColor: Colors.grey,
            canvasColor: Colors.white,
            bottomAppBarTheme: const BottomAppBarTheme(
              color: Colors.white,
              elevation: 0,
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.home,
          routes: routes, // Ensure you define this in your utils/routes.dart
          onGenerateRoute: onGenerateRoute, // Handle dynamic routing
        );
      },
    );
  }
}
