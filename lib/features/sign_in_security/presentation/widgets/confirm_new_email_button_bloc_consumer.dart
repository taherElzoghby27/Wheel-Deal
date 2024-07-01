import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/custom_snack.dart';
import '../../../../core/widgets/small_loading_widget.dart';
import '../controllers/sign_in_and_security_cubit/sign_in_security_cubit.dart';

class ConfirmNewEmailButtonBlocConsumer extends StatelessWidget {
  const ConfirmNewEmailButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInSecurityCubit, SignInSecurityState>(
      listener: (context, state) {
        if (state is UpdateEmailLoaded) {
          GoRouter.of(context).pushReplacement(navPath);
        } else if (state is UpdateEmailFailure) {
          showSnack(
            context,
            message: state.message,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        return Visibility(
          replacement: const LoadingWidget(),
          visible: state is UpdateEmailLoading ? false : true,
          child: CustomButton(
            text: StringsEn.confirmNewEmail,
            styleText: AppConsts.style16White.copyWith(
              fontWeight: FontWeight.w600,
            ),
            onTap: () async =>
                await context.read<SignInSecurityCubit>().updateEmail(),
          ),
        );
      },
    );
  }
}
