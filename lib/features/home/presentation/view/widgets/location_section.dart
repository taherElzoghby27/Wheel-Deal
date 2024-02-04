import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () => GoRouter.of(context).push(locationPath),
          icon: const Icon(
            Icons.my_location,
            color: AppConsts.primary500,
          ),
          label: const Text(
            'Egypt',
            style: AppConsts.style14,
          ),
        ),
      ],
    );
  }
}
