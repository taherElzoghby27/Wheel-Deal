import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/custom_button_with_widget.dart';

class SignWithGoogleAndFaceBookWidget extends StatelessWidget {
  const SignWithGoogleAndFaceBookWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///google
        Expanded(
          child: CustomButtonWithWidget(
            label: StringsEn.google,
            icon: Assets.imagesGoogle,
            onTap: () {},
          ),
        ),
        SizedBox(width: size.width * .025.w),

        ///facebook
        Expanded(
          child: CustomButtonWithWidget(
            label: StringsEn.facebook,
            icon: Assets.imagesFacebook,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
