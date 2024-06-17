import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class RadioButtonRow extends StatelessWidget {
  const RadioButtonRow({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
  });

  final String label;
  final String value;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: label,
          groupValue: value,
          activeColor: AppConsts.mainColor,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: AppConsts.style14.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
