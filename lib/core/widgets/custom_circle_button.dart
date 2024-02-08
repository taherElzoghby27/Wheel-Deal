import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
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
          borderRadius:AppConsts.mainRadiusIcon,
          border: Border.all(color: color ?? AppConsts.neutral300),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: onTap,
              icon: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }
}
