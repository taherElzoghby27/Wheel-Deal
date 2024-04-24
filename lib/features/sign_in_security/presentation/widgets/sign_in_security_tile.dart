import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class SignInSecurityTile extends StatelessWidget {
  const SignInSecurityTile({
    super.key,
    required this.leading,
    required this.subLeading,
    this.onTap,
  });

  final String leading;
  final String subLeading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppConsts.mainRadius,
      child: Container(
        decoration: AppConsts.mainDecoration,
        child: Padding(
          padding: AppConsts.padding15H10V,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    subLeading,
                    style: AppConsts.style12.copyWith(
                      color: AppConsts.neutral500,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
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
