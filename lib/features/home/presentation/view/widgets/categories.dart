import 'package:cars/features/home/presentation/view/widgets/category_detail.dart';
import 'package:cars/features/home/presentation/view/widgets/tabs_widget.dart';
import 'package:flutter/cupertino.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //tabs
        TabsWidget(),
        //category details
        CategoryDetails(),
      ],
    );
  }
}
