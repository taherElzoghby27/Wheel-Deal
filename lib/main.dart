import 'package:cars/core/consts/style.dart';
import 'package:cars/features/settings/presentation/view_model/mode_cubit/mode_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/consts/routesPage.dart';
import 'core/consts/theme.dart';
import 'observer_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Observe();
  runApp(
      //const MyApp()
      DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(), // Wrap your app
      ),
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
        return BlocProvider(
          create: (context) => ModeCubit(),
          child: BlocBuilder<ModeCubit, ModeState>(
            builder: (context, state) {
              final themeState = BlocProvider.of<ModeCubit>(context).state;
              final themeData = themeState.themeMode == ThemeMod.light
                  ? ThemeData.light()
                  : ThemeData.dark();
              return MaterialApp.router(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                routerConfig: router,
                theme: MyAppThemes.lightTheme,
                darkTheme: MyAppThemes.darkTheme,
                themeMode: themeState.themeMode == ThemeMod.light
                    ? ThemeMode.light
                    : ThemeMode.dark,
                themeAnimationStyle: AnimationStyle(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
