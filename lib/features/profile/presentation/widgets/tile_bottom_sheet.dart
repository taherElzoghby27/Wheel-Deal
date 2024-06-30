import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

class TileBottomSheet extends StatelessWidget {
  const TileBottomSheet({
    super.key,
    required this.label,
    this.iconData,
    this.onTap,
  });

  final String label;
  final IconData? iconData;
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
                color: Theme.of(context).canvasColor,
              ),
            ),
            Icon(iconData),
          ],
        ),
      ),
    );
  }
}
