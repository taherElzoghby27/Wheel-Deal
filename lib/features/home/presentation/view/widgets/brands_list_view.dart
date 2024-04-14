import 'package:cars/core/consts/data.dart';
import 'package:flutter/material.dart';

import 'brand_item.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: brands
          .map(
            (item) => BrandItem(brand: item),
          )
          .toList(),
    );
  }
}
