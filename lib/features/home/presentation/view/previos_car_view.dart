import 'package:cars/core/helper/strings.dart';
import 'package:flutter/material.dart';

import '../widgets/previous_car_body.dart';

class PreviousCarView extends StatelessWidget {
  const PreviousCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(StringsEn.prevCar),
      ),
      body: const SafeArea(
        child: PreviousCarBody(),
      ),
    );
  }
}
