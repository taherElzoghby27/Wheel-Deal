import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/routesPage.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/helper/custom_snack.dart';
import '../../../../../core/widgets/customButton.dart';
import '../../../../../core/widgets/small_loading_widget.dart';
import '../../controllers/sign_in_and_security_cubit/sign_in_security_cubit.dart';

class SendButtonBlocConsumer extends StatelessWidget {
  const SendButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInSecurityCubit, SignInSecurityState>(
      listener: (context, state) {
        if (state is CheckCodeInputLoaded) {
          GoRouter.of(context).push(changeEmailAddressPath);
        } else if (state is CheckCodeInputFailure) {
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
          visible: state is CheckCodeInputLoading ? false : true,
          child: CustomButton(
            text: StringsEn.send,
            styleText: AppConsts.style16White.copyWith(
              fontWeight: FontWeight.w600,
            ),
            onTap: () => context.read<SignInSecurityCubit>().checkCodeInput(),
          ),
        );
      },
    );
  }
}
