import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/style.dart';

class CustomRecentOrPopularWidget extends StatelessWidget {
  const CustomRecentOrPopularWidget({
    super.key,
    this.leading,
    required this.jop,
    required this.trailingOnTap,
    required this.trailing,
    this.trailingColor,
  });

  final IconData? leading;
  final String jop;
  final void Function() trailingOnTap;
  final IconData trailing;
  final Color? trailingColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ///leading
          Icon(
            leading,
            color: Theme.of(context).canvasColor.withOpacity(.5),
          ),
          const Spacer(),

          ///jop title
          SizedBox(
            width: size.width * .5,
            child: Text(
              jop,
              style: AppConsts.style14.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).canvasColor.withOpacity(.5),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(flex: 6),

          ///trailing
          IconButton(
            onPressed: trailingOnTap,
            icon: Icon(
              trailing,
              color: trailingColor ??
                  Theme.of(context).canvasColor.withOpacity(.5),
            ),
          ),
        ],
      ),
    );
  }
}
