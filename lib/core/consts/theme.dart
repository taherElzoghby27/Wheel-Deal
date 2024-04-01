import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor:AppConsts.lightBlackDarkMode ,
    primaryColor: AppConsts.lightBlackDarkMode,
    primaryColorDark: AppConsts.mainColor,
    brightness: Brightness.dark,
    fontFamily: AppConsts.mainFont,
    canvasColor: Colors.black,
    splashColor: AppConsts.white,
    colorScheme: const ColorScheme.dark(),
    textTheme: TextTheme(
      headlineSmall: AppConsts.style16,
      headlineLarge: AppConsts.style40.copyWith(
        color: AppConsts.black,
      ),
      bodyMedium: AppConsts.style16.copyWith(
        color: AppConsts.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: AppConsts.style32.copyWith(
        fontWeight: FontWeight.w700,
        color: AppConsts.black,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppConsts.mainColor,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppConsts.mainColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.teal,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor:AppConsts.lightBlack,
    primaryColor: AppConsts.lightBlack,
    primaryColorDark: AppConsts.mainColor,
    brightness: Brightness.dark,
    fontFamily: AppConsts.mainFont,
    canvasColor: Colors.white,
    splashColor: AppConsts.black,
    colorScheme: const ColorScheme.dark(),
    textTheme: TextTheme(
      headlineSmall: AppConsts.style16,
      headlineLarge: AppConsts.style40.copyWith(
        color: AppConsts.white,
      ),
      bodyMedium: AppConsts.style16.copyWith(
        color: AppConsts.black,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: AppConsts.style32.copyWith(
        fontWeight: FontWeight.w700,
        color: AppConsts.white,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppConsts.mainColor,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppConsts.mainColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.sp),
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.teal,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
    ),
  );
}
