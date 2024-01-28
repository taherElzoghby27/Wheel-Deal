import 'package:cars/core/consts/routesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/auth_top_section.dart';
import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/text_form_field.dart';

class CreatePassBody extends StatelessWidget {
  const CreatePassBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Form(
        //key: _formKey,
        child: ListView(
          children: [
            ///top section
            AuthTopSection(
              title: StringsEn.createNewPassword,
              subTitle: StringsEn.setYourNewPass,
              widget: IconButton(
                onPressed: () => GoRouter.of(context).pushReplacement(authPath),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),

            ///Password
            CustomTextFormField(
              perfixIcon: Image.asset(Assets.imagesLockPng),
              hint: StringsEn.password,
              suffixIcon: const Icon(Icons.visibility),
            ),

            ///hint
            Text(
              StringsEn.passwordLeast8Cha,
              style: AppConsts.style14.copyWith(color: AppConsts.neutral400),
            ),
            SizedBox(height: size.height * .05.h),

            ///Password
            CustomTextFormField(
              perfixIcon: Image.asset(Assets.imagesLockPng),
              hint: StringsEn.password,
              suffixIcon: const Icon(Icons.visibility),
              obscureText: true,
            ),

            ///hint
            Text(
              StringsEn.bothPassMustMatch,
              style: AppConsts.style14.copyWith(color: AppConsts.neutral400),
            ),
            SizedBox(height: size.height * .3.h),

            ///Create account or login or reset pass
            SizedBox(
              height: size.height * .055.h,
              width: size.width * .9.w,
              child: CustomButton(
                text: StringsEn.resetPass,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
