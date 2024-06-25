import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/sign_in_security/presentation/controllers/sign_in_and_security_cubit/sign_in_security_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/consts/routesPage.dart';
import 'confirm_new_email_button_bloc_consumer.dart';

class ChangeEmailBody extends StatelessWidget {
  const ChangeEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
          CustomTextFormField(
            hint: StringsEn.newEmailAddress,
            perfixIcon: const Icon(
              Icons.email_outlined,
              color: AppConsts.neutral500,
            ),
            controller: context.read<SignInSecurityCubit>().email,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          const CustomTextFormField(
            hint: StringsEn.confirmNewEmail,
            perfixIcon: Icon(
              Icons.email_outlined,
              color: AppConsts.neutral500,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
          CustomTextFormField(
            hint: StringsEn.yourPassword,
            perfixIcon: const Icon(
              Icons.lock_outline,
              color: AppConsts.neutral500,
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.visibility_outlined,
                color: AppConsts.neutral500,
              ),
            ),
            controller: context.read<SignInSecurityCubit>().password,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () =>GoRouter.of(context).pushReplacement(resetPassPath),
              child: Text(
                StringsEn.forgotPass,
                style: AppConsts.style12.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).canvasColor.withOpacity(.5),
                ),
              ),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio16on5),
          const AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: ConfirmNewEmailButtonBlocConsumer(),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
        ],
      ),
    );
  }
}
