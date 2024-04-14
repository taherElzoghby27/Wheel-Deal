import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class TopLeadingTrailing extends StatelessWidget {
  const TopLeadingTrailing({
    super.key,
    required this.leading,
    this.trailingOnTap,
  });

  final String leading;
  final void Function()? trailingOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading, style: AppConsts.style20),
        trailingOnTap == null
            ? Container()
            : TextButton(
                onPressed: trailingOnTap,
                child: Text(
                  StringsEn.viewAll,
                  style: AppConsts.style14.copyWith(
                    color: AppConsts.mainColor,
                  ),
                ),
              ),
      ],
    );
  }
}
