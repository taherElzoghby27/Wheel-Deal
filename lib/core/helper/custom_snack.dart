import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

showSnack(
  BuildContext context, {
  required String message,
  Color? backGroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
      backgroundColor: backGroundColor ?? AppConsts.success500,
    ),
  );
}
