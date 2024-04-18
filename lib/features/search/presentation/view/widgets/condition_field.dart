import 'package:cars/core/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/consts/strings.dart';
import 'bloc_provider_condition_field_dialog.dart';

enum Condition { New, Used }

class ConditionField extends StatelessWidget {
  const ConditionField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: StringsEn.condition,
      readOnly: true,
      suffixIcon: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const BlocProviderConditionFieldDialog();
            },
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
