import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

class SignInSecurityTile extends StatelessWidget {
  const SignInSecurityTile({
    super.key,
    required this.leading,
    required this.subLeading,
    this.onTap,
    this.trailing,
  });

  final String leading;
  final String subLeading;
  final void Function()? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: trailing == null ? null : onTap,
      borderRadius: AppConsts.mainRadius,
      child: Container(
        decoration: AppConsts.mainDecoration,
        child: Padding(
          padding: AppConsts.padding15H10V,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    leading,
                    style: AppConsts.style12.copyWith(
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    subLeading,
                    style: AppConsts.style12.copyWith(
                      color: Theme.of(context).canvasColor.withOpacity(.5),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              trailing ??
                  IconButton(
                    onPressed: onTap,
                    icon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppConsts.mainColor,
                      size: 12,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
