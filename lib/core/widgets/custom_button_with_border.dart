import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class CustomButtonWithBorder extends StatelessWidget {
  const CustomButtonWithBorder({
    super.key,
    required this.text,
    required this.onTap,
    this.isBorder = true,
    this.onLongTap,
  });

  final String text;
  final Function() onTap;
  final Function()? onLongTap;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      onLongPress: onLongTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).splashColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: AppConsts.mainRadius,
            side: BorderSide(
              color: isBorder
                  ? AppConsts.mainColor
                  : Theme.of(context).splashColor,
              width: isBorder ? 1 : 0,
            ),
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
