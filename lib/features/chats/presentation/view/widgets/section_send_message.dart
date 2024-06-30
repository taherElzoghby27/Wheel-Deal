import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/custom_squre_button.dart';
import 'package:cars/core/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionSendMessage extends StatelessWidget {
  const SectionSendMessage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: AppConsts.aspectRatioNavBar,
      child: Padding(
        padding: AppConsts.padding8H3V,
        child: Row(
          children: [
            SizedBox(width: size.width * .01.w),
            //asset
            Padding(
              padding: AppConsts.padding6,
              child: const CustomSquareButton(
                icon: Icons.mic_rounded,
              ),
            ),
            SizedBox(width: size.width * .02.w),
            //write a message
            Expanded(
              child: CustomTextField(
                hint: StringsEn.writeAMessage,
                controller: TextEditingController(),
              ),
            ),
            SizedBox(width: size.width * .02.w),
            //microphone
            Padding(
              padding: AppConsts.padding6,
              child: const CustomSquareButton(
                icon: Icons.send,
              ),
            ),
            SizedBox(width: size.width * .01.w),
          ],
        ),
      ),
    );
  }
}
