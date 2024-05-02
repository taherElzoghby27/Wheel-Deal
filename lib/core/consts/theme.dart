import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppConsts.white,
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
    appBarTheme: AppBarTheme(
      backgroundColor:AppConsts.white ,
      titleTextStyle: AppConsts.style32.copyWith(
        fontWeight: FontWeight.w700,
        color: AppConsts.black,
        fontSize: 20,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppConsts.black,
    primaryColor: AppConsts.lightBlack,
    primaryColorDark: AppConsts.mainColor,
    brightness: Brightness.dark,
    fontFamily: AppConsts.mainFont,
    canvasColor: AppConsts.white,
    splashColor: AppConsts.black,
    colorScheme: const ColorScheme.dark(),
    textTheme: TextTheme(
      headlineSmall: AppConsts.style16,
      headlineLarge: AppConsts.style40.copyWith(
        color: AppConsts.white,
      ),
      bodySmall: AppConsts.style16.copyWith(
        color: AppConsts.grey,
        fontSize: 14,
        fontWeight: FontWeight.w700,
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
    appBarTheme: AppBarTheme(
      backgroundColor: AppConsts.black,
      titleTextStyle: AppConsts.style32.copyWith(
        fontWeight: FontWeight.w700,
        color: AppConsts.white,
        fontSize: 20,
      ),
    ),
  );
}
