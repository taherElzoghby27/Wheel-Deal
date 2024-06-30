import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/features/sign_in_security/presentation/controllers/two_step_verification_cubit/two_step_verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes_page.dart';
import '../sign_in_security_tile.dart';

class TwoStepVerificationWidget extends StatefulWidget {
  const TwoStepVerificationWidget({super.key});

  @override
  State<TwoStepVerificationWidget> createState() =>
      _TwoStepVerificationWidgetState();
}

class _TwoStepVerificationWidgetState extends State<TwoStepVerificationWidget> {
  bool twoStepVerification = false;

  @override
  Widget build(BuildContext context) {
    return SignInSecurityTile(
      leading: StringsEn.twoStepVerifi,
      subLeading: StringsEn.subTwoStepVerification,
      trailing:
          BlocConsumer<TwoStepVerificationCubit, TwoStepVerificationState>(
        listener: (context, state) {
          if (!twoStepVerification) {
            GoRouter.of(context).push(twoStepVerificationSecurityPath);
          }
        },
        builder: (context, state) {
          if (state is Switched) {
            twoStepVerification = state.value;
          }
          return Switch(
            value: twoStepVerification,
            activeTrackColor: AppConsts.mainColor,
            thumbColor: MaterialStateProperty.all(
              AppConsts.neutral100,
            ),
            inactiveTrackColor: Theme.of(context).canvasColor.withOpacity(.1),
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
