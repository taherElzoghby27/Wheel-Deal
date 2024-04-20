import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class TileBottomSheet extends StatelessWidget {
  const TileBottomSheet({
    super.key,
    required this.label,
    required this.iconData,
    this.onTap,
  });

  final String label;
  final IconData iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.padding15H10V,
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppConsts.style14.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(iconData),
          ],
        ),
      ),
    );
  }
}
