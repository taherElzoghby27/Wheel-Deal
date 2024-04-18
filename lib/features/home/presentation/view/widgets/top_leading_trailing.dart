import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class TopLeadingTrailing extends StatelessWidget {
  const TopLeadingTrailing({
    super.key,
    required this.leading,
    this.trailingOnTap,
    this.trailing,
    this.leadingColor,
  });

  final String leading;
  final void Function()? trailingOnTap;
  final String? trailing;
  final Color? leadingColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leading,
          style: AppConsts.style20.copyWith(
            color: leadingColor ?? Theme.of(context).canvasColor,
          ),
        ),
        trailingOnTap == null
            ? Container()
            : TextButton(
                onPressed: trailingOnTap,
                child: Text(
                  trailing ?? StringsEn.viewAll,
                  style: AppConsts.style14.copyWith(
                    color: AppConsts.mainColor,
                  ),
                ),
              ),
      ],
    );
  }
}
