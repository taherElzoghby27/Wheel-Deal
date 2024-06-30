import 'package:cars/core/theming/style.dart';
import 'package:cars/features/sign_in_security/presentation/controllers/two_step_verification_cubit/two_step_verification_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'enter_phone_or_email.dart';
import 'two_step_verification_code_sms_or_email.dart';

class TwoStepVerificationSecurityBody extends StatelessWidget {
  const TwoStepVerificationSecurityBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: BlocBuilder<TwoStepVerificationCubit, TwoStepVerificationState>(
        builder: (context, state) {
          TwoStepVerificationCubit bloc =
              context.read<TwoStepVerificationCubit>();
          //if (state is ChangePageStatus) {}
          return bloc.page == ''
              ? const TwoStepVerificationSecurityCodeSmsOrEmail()
              : EnterPhoneOrEmail(status: bloc.page);
        },
      ),
    );
  }
}
