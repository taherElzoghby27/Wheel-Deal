import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class TileSetting extends StatelessWidget {
  const TileSetting({
    super.key,
    required this.leading,
    required this.trailing,
  });

  final String leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: AppConsts.style12.copyWith(
              color: Theme.of(context).canvasColor,
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
