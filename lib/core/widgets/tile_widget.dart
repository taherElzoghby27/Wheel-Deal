import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({
    super.key,
    required this.label,
    this.textAlign,
    this.trailingOnTap,
    this.trailingLabel,
  });

  final String label;
  final TextAlign? textAlign;
  final void Function()? trailingOnTap;
  final String? trailingLabel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspectRatio24on2,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor.withOpacity(.1),
          border: const Border.symmetric(
            vertical: BorderSide(
              color: AppConsts.neutral300,
            ),
          ),
        ),
        child: Padding(
          padding: AppConsts.padding15H,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: AppConsts.style14,
                textAlign: textAlign ?? TextAlign.left,
              ),
              TextButton(
                onPressed: trailingOnTap,
                child: Text(
                  trailingLabel ?? '',
                  style: AppConsts.style14.copyWith(
                    color: AppConsts.primary500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
