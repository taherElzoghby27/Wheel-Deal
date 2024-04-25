import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class CustomButtonWithBorder extends StatelessWidget {
  const CustomButtonWithBorder({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).primaryColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: AppConsts.mainRadius,
            side: const BorderSide(color: AppConsts.mainColor),
          ),
        ),
      ),
      child: Text(
        text,
        style: AppConsts.style16White.copyWith(
          color: AppConsts.mainColor,
        ),
      ),
    );
  }
}
