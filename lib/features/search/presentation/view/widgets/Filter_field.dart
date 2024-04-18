import 'package:cars/core/widgets/text_field.dart';
import 'package:flutter/material.dart';

class FilterField extends StatelessWidget {
  const FilterField({
    super.key,
    required this.label,
    required this.widget,
  });

  final String label;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: label,
      readOnly: true,
      suffixIcon: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => widget,
          );
        },
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }
}
