import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.background = AppConsts.primary500,
    this.isBorder = false,
    this.styleText = AppConsts.style16White,
  });

  final String text;
  final Color background;
  final bool isBorder;
  final Function() onTap;
  final TextStyle styleText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
