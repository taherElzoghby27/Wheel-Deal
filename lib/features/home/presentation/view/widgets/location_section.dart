import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        DropdownButtonHideUnderline(
          child: DropdownMenu<String>(
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              activeIndicatorBorder: BorderSide(width: 0),
              outlineBorder: BorderSide(width: 0),
            ),
            leadingIcon: const Icon(Icons.location_on),
            trailingIcon: const Icon(Icons.expand_more),
            selectedTrailingIcon: const Icon(Icons.expand_less),
            width: size.width * .375.w,
            hintText: 'egypt',
            textStyle: AppConsts.style14,
            dropdownMenuEntries: const [
              DropdownMenuEntry<String>(
                value: 'egypt',
                label: 'egypt',
              ),
              DropdownMenuEntry<String>(
                value: 'tanta',
                label: 'tanta',
              ),
              DropdownMenuEntry<String>(
                value: 'cairo',
                label: 'cairo',
              ),
              DropdownMenuEntry<String>(
                value: 'qutor',
                label: 'qutor',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
