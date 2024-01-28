import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.leadingOnTap,
    required this.title,
    this.trailingOnTap,
    this.trailingWidget,
    this.image,
  });

  final void Function()? leadingOnTap;
  final String title;
  final void Function()? trailingOnTap;
  final Widget? trailingWidget;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///arrow back
        leadingOnTap == null
            ? Container()
            : IconButton(
                onPressed: leadingOnTap,
                icon: const Icon(Icons.arrow_back),
              ),
        const Spacer(),

        ///set filter
        image == null
            ? Text(
                title,
                style: AppConsts.style20.copyWith(
                  color: AppConsts.neutral900,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SvgPicture.asset(image!),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    title,
                    style: AppConsts.style20.copyWith(
                      color: AppConsts.neutral900,
                    ),
                  ),
                ],
              ),
        const Spacer(),

        ///reset
        trailingWidget == null
            ? Container()
            : TextButton(
                onPressed: trailingOnTap,
                child: trailingWidget!,
              ),
      ],
    );
  }
}
