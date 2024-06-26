import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/auth_top_section.dart';
import 'package:cars/features/auth/presentation/view_model/check_for_reset_cubit/check_for_reset_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/consts/strings.dart';
import 'checking_for_reset_password_button.dart';
import 'replacement_auth_widget.dart';
import 'reset_pass_component.dart';

class ResetPassBodyInfo extends StatefulWidget {
  const ResetPassBodyInfo({super.key});

  @override
  State<ResetPassBodyInfo> createState() => _ResetPassBodyInfoState();
}

class _ResetPassBodyInfoState extends State<ResetPassBodyInfo>
    with SingleTickerProviderStateMixin {
  late CheckForResetCubit checkForResetCubit;

  @override
  void initState() {
    checkForResetCubit = context.read<CheckForResetCubit>();
    //init controller
    checkForResetCubit.controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    //offset animation
    checkForResetCubit.offsetAnimation = TweenSequence(itemsSequences).animate(
      checkForResetCubit.controller,
    );
    super.initState();
  }

  @override
  void dispose() {
    checkForResetCubit.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Form(
        key: checkForResetCubit.formKey,
        child: ListView(
          children: [
            const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

            ///top section
            const AuthTopSection(
              title: StringsEn.resetPass,
              subTitle: StringsEn.enterEmailAddressYouUsed,
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

            //fields
            AspectRatio(
              aspectRatio: AppConsts.aspect16on14,
              child: AnimatedBuilder(
                animation: checkForResetCubit.controller,
                builder: (context, child) {
                  return AnimatedSlide(
                    offset: checkForResetCubit.offsetAnimation.value,
                    duration: const Duration(milliseconds: 200),
                    child: const ResetPasswordComponent(),
                  );
                },
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio16on3),
            //You remember your password
            ReplacementAuthWidget(
              label: StringsEn.youRemeberYourPassword,
              trailing: StringsEn.login,
              onTap: () => GoRouter.of(context).pushReplacement(
                loginPath,
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),

            //reset pass
            const CheckingForRestButtonWidget(),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
          ],
        ),
      ),
    );
  }
}
