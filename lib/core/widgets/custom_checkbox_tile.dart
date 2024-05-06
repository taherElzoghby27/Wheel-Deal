import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxTile extends StatelessWidget {
  const CustomCheckBoxTile({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
  });

  final String label;
  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          activeColor: AppConsts.mainColor,
          checkColor: AppConsts.white,
          side: const BorderSide(color: AppConsts.mainColor),
          onChanged: onChanged,
        ),
        Text(
          label,
          style: AppConsts.style14.copyWith(
            color: Theme.of(context).canvasColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
