import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class CustomSquareButton extends StatelessWidget {
  const CustomSquareButton({
    super.key,
    this.onTap,
    required this.icon,
    this.color,
    this.colorIcon,
  });

  final IconData icon;
  final void Function()? onTap;
  final Color? color;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppConsts.mainRadiusIcon,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: AppConsts.mainRadius,
        ),
        child: Center(
          child: Padding(
            padding: AppConsts.padding2,
            child: IconButton(
              onPressed: onTap,
              icon: Icon(
                icon,
                color: AppConsts.mainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
