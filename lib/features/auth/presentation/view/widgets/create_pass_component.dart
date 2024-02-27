import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/consts/assets.dart';

class CreatePassComponent extends StatefulWidget {
  const CreatePassComponent({super.key});

  @override
  State<CreatePassComponent> createState() => _CreatePassComponentState();
}

class _CreatePassComponentState extends State<CreatePassComponent> {
  bool pass1Visible = false;
  bool pass2Visible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Password
        CustomTextFormField(
          perfixIcon: Image.asset(Assets.imagesLockPng),
          hint: StringsEn.password,
          suffixIcon: IconButton(
            onPressed: () => setState(() => pass1Visible = !pass1Visible),
            icon: Icon(pass1Visible ? Icons.visibility : Icons.visibility_off),
          ),
          obscureText: pass1Visible,
        ),

        ///hint
        Text(
          StringsEn.warningFields,
          style: AppConsts.style14.copyWith(color: AppConsts.neutral400),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

        ///Password
        CustomTextFormField(
          perfixIcon: Image.asset(Assets.imagesLockPng),
          hint: StringsEn.password,
          suffixIcon: IconButton(
            onPressed: () => setState(() => pass2Visible = !pass2Visible),
            icon: Icon(pass2Visible ? Icons.visibility : Icons.visibility_off),
          ),
          obscureText: pass2Visible,
        ),

        ///hint
        Text(
          StringsEn.bothPassMustMatch,
          style: AppConsts.style14.copyWith(color: AppConsts.neutral400),
        ),
      ],
    );
  }
}
