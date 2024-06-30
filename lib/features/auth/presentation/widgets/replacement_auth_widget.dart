import 'package:cars/core/theming/style.dart';
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
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              trailing,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).canvasColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
