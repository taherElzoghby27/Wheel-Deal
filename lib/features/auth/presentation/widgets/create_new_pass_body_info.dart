import 'package:cars/core/consts/data.dart';
import 'package:cars/features/auth/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/auth_top_section.dart';
import 'create_pass_component.dart';
import 'reset_pass_button_widget.dart';

class CreateNewPasswordBodyInfo extends StatefulWidget {
  const CreateNewPasswordBodyInfo({super.key});

  @override
  State<CreateNewPasswordBodyInfo> createState() =>
      _CreateNewPasswordBodyInfoState();
}

class _CreateNewPasswordBodyInfoState extends State<CreateNewPasswordBodyInfo>
    with SingleTickerProviderStateMixin {
  late ResetPasswordCubit resetPasswordCubit;

  @override
  void initState() {
    resetPasswordCubit = context.read<ResetPasswordCubit>();
    //init controller
    resetPasswordCubit.controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    //offset animation
    resetPasswordCubit.offsetAnimation = TweenSequence(itemsSequences).animate(
      resetPasswordCubit.controller,
    );
    super.initState();
  }

  @override
  void dispose() {
    resetPasswordCubit.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Form(
        key: resetPasswordCubit.formKey,
        child: ListView(
          children: [
            const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),

            ///top section
            const AuthTopSection(
              title: StringsEn.createNewPassword,
              subTitle: StringsEn.setYourNewPass,
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
            //fields
            AspectRatio(
              aspectRatio: AppConsts.aspect16on14,
              child: AnimatedBuilder(
                animation: resetPasswordCubit.controller,
                builder: (context, child) {
                  return AnimatedSlide(
                    offset: resetPasswordCubit.offsetAnimation.value,
                    duration: const Duration(milliseconds: 200),
                    child: const CreatePassComponent(),
                  );
                },
              ),
            ),

            const AspectRatio(aspectRatio: AppConsts.aspectRatio16on7),

            ///Create account or login or reset pass
            const ResetPassButtonWidget(),
          ],
        ),
      ),
    );
  }
}

