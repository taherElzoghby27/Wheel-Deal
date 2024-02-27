
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class ReplacementAuthWidget extends StatelessWidget {
  const ReplacementAuthWidget({
    super.key,
    required this.label,
    required this.trailing,
    this.onTap,
  });

  final String label;
  final String trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspectRatio16on2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: AppConsts.style14,
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              trailing,
              style: AppConsts.style14.copyWith(
                color: AppConsts.primary500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
