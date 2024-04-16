import 'package:flutter/material.dart';

import '../consts/style.dart';

class CustomAppBarScaffold extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarScaffold({
    Key? key,
    this.leading,
    this.title,
    this.trailing,
  }) : super(key: key);
  final Widget? leading;
  final String? title;
  final Widget? trailing;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(padding: AppConsts.padding6, child: leading),
      title: Text(
        title ?? '',
        style: AppConsts.style20.copyWith(color: AppConsts.mainColor),
      ),
      centerTitle: true,
      actions: [Padding(padding: AppConsts.padding6, child: trailing)],
    );
  }
}
