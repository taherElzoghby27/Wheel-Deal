import 'package:cars/core/consts/strings.dart';
import 'package:flutter/material.dart';

class AuthTopSection extends StatelessWidget {
  const AuthTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringsEn.logo,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          '.',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).primaryColorDark,
              ),
        ),
      ],
    );
  }
}
