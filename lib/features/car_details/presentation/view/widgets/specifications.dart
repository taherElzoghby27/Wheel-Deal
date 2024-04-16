import 'package:cars/core/consts/data.dart';
import 'package:flutter/material.dart';

import 'item_specification.dart';

class Specifications extends StatelessWidget {
  const Specifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        runSpacing: 10,
        spacing: 7,
        children: specifications
            .map(
              (e) => ItemSpecification(
                ky: e.key,
                value: e.value,
                icon: e.icon,
              ),
            )
            .toList(),
      ),
    );
  }
}
