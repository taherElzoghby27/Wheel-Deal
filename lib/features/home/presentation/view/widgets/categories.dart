import 'package:cars/features/home/presentation/view/widgets/category_detail.dart';
import 'package:cars/features/home/presentation/view/widgets/tabs_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        //tabs
        const TabsWidget(),
        SizedBox(height: size.height * .02.h),
        //category details
        const CategoryDetails(),
      ],
    );
  }
}
