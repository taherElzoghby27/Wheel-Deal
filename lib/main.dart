import 'package:cars/core/helper/flutter_secure_storage.dart';
import 'package:cars/core/services/hive_db/hive_db_cars_home.dart';
import 'package:cars/core/services/service_locator.dart';
import 'package:cars/features/settings/presentation/view_model/mode_cubit/mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/consts/routesPage.dart';
import 'core/consts/theme.dart';
import 'core/services/api_service.dart';
import 'core/services/hive_db/hive_db_brands_home.dart';
import 'observer_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveDbBrandsHome.init();
  HiveDbCarsHome.init();
  ApiService.initDio();
  FlutterSecureStorageEncrypted().init();
  setupServiceLocator();
  Bloc.observer = Observe();
  runApp(const MyApp()
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
        return BlocProvider(
          create: (context) => ModeCubit(),
          child: BlocBuilder<ModeCubit, ModeState>(
            builder: (context, state) {
              final themeState = BlocProvider.of<ModeCubit>(context).state;
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
