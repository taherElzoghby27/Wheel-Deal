import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.leadingOnTap,
    required this.title,
    this.trailingOnTap,
    this.trailingWidget,
    this.image,
    this.color = AppConsts.mainColor,
  });

  final void Function()? leadingOnTap;
  final String title;
  final void Function()? trailingOnTap;
  final Widget? trailingWidget;
  final String? image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(4.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///arrow back
          leadingOnTap == null && image == null
              ? Container(width: size.width * .15.w)
              : leadingOnTap == null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        image!,
                        height: size.height * .075.h,
                      ),
                    )
                  : IconButton(
                      onPressed: leadingOnTap,
                      icon: Icon(Icons.arrow_back_ios_new, color: color),
                    ),

          Text(
            title,
            style: AppConsts.style20.copyWith(
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
          //const Spacer(),

          ///reset
          trailingWidget == null
              ? Container(width: size.width * .1.w)
              : TextButton(
                  onPressed: trailingOnTap,
                  child: trailingWidget!,
                ),
        ],
      ),
    );
  }
}
