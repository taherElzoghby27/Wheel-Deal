import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_photo.dart';

class LogoTitleIconWidget extends StatelessWidget {
  const LogoTitleIconWidget({
    super.key,
    required this.logo,
    required this.jopTitle,
    required this.company,
    required this.country,
    required this.trailing,
    this.onTap,
  });

  final String logo;
  final String jopTitle;
  final String company;
  final String country;

  final Widget trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///logo
          CustomPhoto(
            image: logo,
            height: size.height * .055.h,
          ),
          SizedBox(width: size.width * .02.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///title
              FittedBox(
                child: SizedBox(
                  width: size.width * .45.w,
                  child: Text(
                    jopTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppConsts.style32.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              ///company.country
              SizedBox(
                width: size.width * .4.w,
                child: Text(
                  '$company.$country',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppConsts.styleHint14.copyWith(
                    fontSize: 12,
                    color: AppConsts.neutral700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: size.width * .02.w),

          ///trailing
          SizedBox(width: size.width * .2.w, child: Center(child: trailing)),
        ],
      ),
    );
  }
}
