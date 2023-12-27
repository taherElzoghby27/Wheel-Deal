import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

import 'core/consts/routesPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppConsts.mainColor),
        fontFamily: AppConsts.mainFont,
      ),
    );
  }
}
