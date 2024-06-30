import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

class CustomSquareButton extends StatelessWidget {
  const CustomSquareButton({
    super.key,
    required this.icon,
    this.color,
    this.colorIcon,
    this.onTap,
  });

  final IconData icon;
  final Color? color;
  final Color? colorIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppConsts.mainRadius,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).canvasColor.withOpacity(.05),
          borderRadius: AppConsts.mainRadius,
        ),
        child: Center(
          child: Padding(
            padding: AppConsts.padding8,
            child: Icon(
              icon,
              color: AppConsts.mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
