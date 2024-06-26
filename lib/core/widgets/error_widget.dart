import 'package:cars/core/theming/style.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: AppConsts.style20.copyWith(
              color: Theme.of(context).canvasColor,
            ),
          ),
        ],
      ),
    );
  }
}
