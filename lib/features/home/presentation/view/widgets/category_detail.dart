import 'package:flutter/cupertino.dart';

import '../../../../../core/widgets/car_component.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 10, // spacing between rows
        crossAxisSpacing: 10, // spacing between columns
        childAspectRatio: 2.25 / 3,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return CarComponent();
      },
    );
  }
}
