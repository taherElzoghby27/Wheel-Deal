import 'package:cars/core/theming/style.dart';
import 'package:flutter/cupertino.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.height = 0,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        color: AppConsts.mainColor,
      ),
    );
  }
}
