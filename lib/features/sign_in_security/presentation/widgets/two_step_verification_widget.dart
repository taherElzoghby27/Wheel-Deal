import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/features/sign_in_security/presentation/controllers/two_step_verification_cubit/two_step_verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in_security_tile.dart';

class TwoStepVerificationWidget extends StatelessWidget {
  const TwoStepVerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInSecurityTile(
      leading: StringsEn.twoStepVerifi,
      subLeading: StringsEn.subTwoStepVerification,
      trailing: BlocBuilder<TwoStepVerificationCubit, TwoStepVerificationState>(
        builder: (context, state) {
          bool twoStepVerification = false;
          if (state is Switched) {
            twoStepVerification = state.value;
          }
          return Switch(
            value: twoStepVerification,
            activeTrackColor: AppConsts.mainColor,
            thumbColor: MaterialStateProperty.all(
              Theme.of(context).canvasColor,
            ),
            onChanged: (bool value) =>
                context.read<TwoStepVerificationCubit>().changeSwitch(
                      value,
                    ),
          );
        },
      ),
    );
  }
}
