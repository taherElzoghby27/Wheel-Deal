import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

import 'installment_available_component.dart';

class SectionDetails extends StatelessWidget {
  const SectionDetails({
    super.key,
    required this.leading,
    required this.trailing,
  });

  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  leading,
                  style: AppConsts.style20,
                  textAlign: TextAlign.left,
                ),
              ),
              const Spacer(flex: 2),
              Expanded(
                flex: 4,
                child: Text(
                  trailing,
                  style: AppConsts.style20.copyWith(color: AppConsts.mainColor),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * .01),
          const InstallmentAvailableComponent(),
        ],
      ),
    );
  }
}
