import 'package:cars/core/theming/style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ScanComponent extends StatelessWidget {
  const ScanComponent({
    super.key,
    required this.title,
    required this.subTitle2,
    this.onTap,
    required this.trailing,
    this.subTitle1,
  });

  final String title;
  final String? subTitle1;
  final String subTitle2;
  final Widget trailing;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppConsts.radius10,
      child: DottedBorder(
        dashPattern: const [5, 5],
        strokeWidth: 1,
        radius: const Radius.circular(10),
        borderType: BorderType.RRect,
        color: Theme.of(context).canvasColor.withOpacity(.2),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: AppConsts.radius10,
          ),
          child: Padding(
            padding: AppConsts.padding15H10V,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppConsts.style16.copyWith(
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                      subTitle1 != null
                          ? Text(
                              subTitle1!,
                              style: AppConsts.style12.copyWith(
                                fontSize: 10,
                                color: Theme.of(context)
                                    .canvasColor
                                    .withOpacity(.5),
                              ),
                            )
                          : Container(),
                      Text(
                        subTitle2,
                        style: AppConsts.style12.copyWith(
                          fontSize: 10,
                          color: Theme.of(context).canvasColor.withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: trailing,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
