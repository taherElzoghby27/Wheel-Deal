import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/features/sign_in_security/presentation/controllers/two_step_verification_cubit/two_step_verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes_page.dart';
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
          return CustomButton(
            text: StringsEn.verify,
            styleText: AppConsts.style16White,
            onTap: () {
              if (!context
                  .read<TwoStepVerificationCubit>()
                  .twoStepVerification) {
                GoRouter.of(context).push(twoStepVerificationSecurityPath);
              }
            },
          );
        },
      ),
    );
  }
}
