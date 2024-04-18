import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/consts/strings.dart';

class CustomTileInfoHelpCenter extends StatefulWidget {
  const CustomTileInfoHelpCenter({super.key});

  @override
  State<CustomTileInfoHelpCenter> createState() =>
      _CustomTileInfoHelpCenterState();
}

class _CustomTileInfoHelpCenterState extends State<CustomTileInfoHelpCenter> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Container(
        decoration: AppConsts.mainDecoration,
        child: Padding(
          padding: AppConsts.padding8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringsEn.lorem,
                    style: AppConsts.style32.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() => isOpen = !isOpen),
                    icon: Icon(
                      isOpen
                          ? Icons.arrow_drop_up_sharp
                          : Icons.arrow_drop_down,
                      color: AppConsts.mainColor,
                    ),
                  ),
                ],
              ),
              isOpen
                  ? SizedBox(
                      width: size.width * .85.w,
                      child: Text(
                        StringsEn.loremIpsum,
                        style: AppConsts.styleHint14.copyWith(
                          color: AppConsts.neutral500,
                        ),
                        maxLines: 6,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
