import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

class CustomButtonThreeWidget extends StatelessWidget {
  const CustomButtonThreeWidget({
    super.key,
    this.leading,
    required this.title,
    this.trailing,
    required this.onTap,
    this.decoration,
    this.color = AppConsts.neutral900,
  });

  final Widget? leading;
  final String title;
  final Widget? trailing;
  final void Function() onTap;
  final Decoration? decoration;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: AppConsts.mainColor,
      borderRadius: AppConsts.mainRadius,
      child: Padding(
        padding: AppConsts.padding6,
        child: AspectRatio(
          aspectRatio: AppConsts.aspectRatio16on2,
          child: Container(
            decoration: AppConsts.mainDecoration.copyWith(
              color: Theme.of(context).canvasColor.withOpacity(.01),
              border: Border.all(
                color: Theme.of(context).canvasColor.withOpacity(.1),
              ),
            ),
            child: Padding(
              padding: AppConsts.padding8,
              child: Row(
                children: [
                  leading ?? Container(),
                  const Spacer(flex: 1),
                  Text(
                    title,
                    style: AppConsts.style32.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  const Spacer(flex: 7),
                  trailing ??
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppConsts.mainColor,
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
