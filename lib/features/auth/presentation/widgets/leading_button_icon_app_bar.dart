import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

class LeadingIconButtonAppBar extends StatelessWidget {
  const LeadingIconButtonAppBar({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.padding8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppConsts.mainRadius,
          border: Border.all(
            color: Theme.of(context).canvasColor,
          ),
        ),
        child: Center(
          child: IconButton(
            onPressed: onTap,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).canvasColor,
            ),
          ),
        ),
      ),
    );
  }
}
