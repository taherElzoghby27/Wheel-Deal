import 'package:cars/core/consts/style.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/consts/routesPage.dart';
import 'core/consts/theme.dart';

void main() {
  runApp(
    const MyApp()
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: MyAppThemes.lightTheme,
          darkTheme: MyAppThemes.darkTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
