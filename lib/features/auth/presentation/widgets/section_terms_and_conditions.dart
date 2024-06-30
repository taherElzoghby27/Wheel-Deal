import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';


class SectionTermsAndConditions extends StatelessWidget {
  const SectionTermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
          activeColor: AppConsts.mainColor,
        ),
        Expanded(
          child: Row(
            children: [
              Text(
                StringsEn.iHaveReadAndAgreed,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                    ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    StringsEn.termsAndConditions,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 12,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
