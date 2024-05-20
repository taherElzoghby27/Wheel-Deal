import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class SomeThingErrorWidget extends StatelessWidget {
  const SomeThingErrorWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppConsts.mainPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: AppConsts.style24.copyWith(
                color: Theme.of(context).canvasColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
