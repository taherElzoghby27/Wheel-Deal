import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/home/presentation/view/widgets/tab_widget.dart';
import 'package:flutter/material.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({super.key});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TabWidget(
          label: StringsEn.all,
          active: current == 0 ? true : false,
          onTap: () => setState(() => current = 0),
        ),
        TabWidget(
          label: StringsEn.newCar,
          active: current == 1 ? true : false,
          onTap: () => setState(() => current = 1),
        ),
        TabWidget(
          label: StringsEn.usedCar,
          active: current == 2 ? true : false,
          onTap: () => setState(() => current = 2),
        ),
        TabWidget(
          label: StringsEn.rentCar,
          active: current == 3 ? true : false,
          onTap: () => setState(() => current = 3),
        ),
      ],
    );
  }
}
