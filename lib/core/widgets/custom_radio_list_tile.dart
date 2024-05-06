import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class CustomRadiusListTile<T> extends StatelessWidget {
  const CustomRadiusListTile({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });

  final String label;
  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      title: Text(
        label,
        style: AppConsts.style14.copyWith(
          fontWeight: FontWeight.w400,
          color: Theme.of(context).canvasColor.withOpacity(.5),
        ),
      ),
      value: value,
      groupValue: groupValue,
      activeColor: AppConsts.mainColor,
      onChanged: onChanged,
    );
  }
}
