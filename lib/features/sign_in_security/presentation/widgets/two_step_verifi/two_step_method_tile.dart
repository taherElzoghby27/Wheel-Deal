import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class TwoStepMethodTile extends StatelessWidget {
  const TwoStepMethodTile({
    super.key,
    required this.leading,
    required this.trailing,
  });

  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leading,
          style: AppConsts.style12.copyWith(
            color: Theme.of(context).canvasColor,
            fontSize: 10,
          ),
        ),
        Container(
          decoration: AppConsts.secondaryMainDecoration.copyWith(
            color: Theme.of(context).canvasColor.withOpacity(.025),
          ),
          width: size.width * .5,
          child: Padding(
            padding: AppConsts.padding8H3V,
            child: Text(
              trailing,
              style: AppConsts.style12.copyWith(
                color: AppConsts.mainColor,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
