import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/sign_in_security/presentation/controllers/sign_in_and_security_cubit/sign_in_security_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_email_address_verify_bloc_consumer.dart';

class EmailAddressBody extends StatelessWidget {
  const EmailAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on3),
          Text(
            StringsEn.yourEmail,
            style: AppConsts.style16White.copyWith(
              color: Theme.of(context).canvasColor,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          CustomTextFormField(
            hint: StringsEn.enterYouEmail,
            perfixIcon: const Icon(
              Icons.email_outlined,
              color: AppConsts.neutral500,
            ),
            controller: context.read<SignInSecurityCubit>().email,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
          const AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: ChangeEmailAddressButtonVerifyBlocConsumer(),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
        ],
      ),
    );
  }
}
