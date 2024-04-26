import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/custom_button_with_border.dart';
import 'package:cars/features/sign_in_security/presentation/controllers/two_step_verification_cubit/two_step_verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmsOrEmail extends StatelessWidget {
  const SmsOrEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TwoStepVerificationCubit, TwoStepVerificationState>(
      builder: (context, state) {
        TwoStepVerificationCubit bloc =
            context.read<TwoStepVerificationCubit>();
        String status = StringsEn.sms;
        if (state is SmsOrEmailState) {
          status = state.value;
        }
        return Column(
          children: [
            AspectRatio(
              aspectRatio: AppConsts.aspectRatioButtonAuth,
              child: CustomButtonWithBorder(
                text: StringsEn.sms,
                isBorder: status == StringsEn.sms ? true : false,
                onTap: () {
                  bloc.changeSmsOrEmail(StringsEn.sms);
                  bloc.changePage(StringsEn.sms);
                },
                onLongTap: () => bloc.changeSmsOrEmail(StringsEn.sms),
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
            AspectRatio(
              aspectRatio: AppConsts.aspectRatioButtonAuth,
              child: CustomButtonWithBorder(
                text: StringsEn.email,
                isBorder: status == StringsEn.email ? true : false,
                onTap: () {
                  bloc.changeSmsOrEmail(StringsEn.email);
                  bloc.changePage(StringsEn.email);
                },
                onLongTap: () => bloc.changeSmsOrEmail(StringsEn.email),
              ),
            ),
          ],
        );
      },
    );
  }
}
