import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_app_bar.dart';
import 'package:cars/core/widgets/custom_divider.dart';
import 'package:cars/features/edit_profile/presentation/view/widgets/fields_section.dart';
import 'package:cars/features/profile/presentation/widgets/section_info_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/customButton.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        //   title
        CustomAppBar(
          leadingOnTap: ()=>GoRouter.of(context).pop(),
          title: StringsEn.editProfile,
          trailingOnTap: () {},
        ),
        //User info
        const SectionInfoUser(),
        const CustomDivider(),

        //fields
        const FieldsSection(),
        const AspectRatio(aspectRatio: AppConsts.aspectRatioButtonDetailsCar),
        //done button

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
            child: CustomButton(
              text: StringsEn.done,
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
