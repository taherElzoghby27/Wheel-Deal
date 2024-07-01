import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
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
        final bloc = context.read<TwoStepVerificationCubit>();
        return Padding(
          padding: AppConsts.padding25h,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: AppConsts.aspectRatioButtonAuth,
                child: CustomButtonWithBorder(
                  text: StringsEn.sms,
                  onTap: () => bloc.changePage(StringsEn.sms),
                ),
              ),
              const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),
              AspectRatio(
                aspectRatio: AppConsts.aspectRatioButtonAuth,
                child: CustomButtonWithBorder(
                  text: StringsEn.email,
                  onTap: () => bloc.changePage(StringsEn.email),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
