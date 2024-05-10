import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'confirm_password_widget.dart';
import 'password_widget.dart';

class CreateAccountComponent1 extends StatelessWidget {
  const CreateAccountComponent1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final signUpCubit = context.read<SignUpCubit>();
        return Column(
          children: [
            //first name - last name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 7,
                  child: CustomTextFormField(
                    perfixIcon: const Icon(
                      Icons.person,
                      color: AppConsts.neutral500,
                    ),
                    hint: StringsEn.firstName,
                    onChanged: (String? value) => signUpCubit.onChangeValue(
                      StringsEn.firstName,
                      value!,
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 7,
                  child: CustomTextFormField(
                    perfixIcon: const Icon(
                      Icons.person,
                      color: AppConsts.neutral500,
                    ),
                    hint: StringsEn.lastName,
                    onChanged: (String? value) => signUpCubit.onChangeValue(
                      StringsEn.lastName,
                      value!,
                    ),
                  ),
                ),
              ],
            ),
            const AspectRatio(
              aspectRatio: AppConsts.aspectRatio20on1,
            ),

            ///Email

            CustomTextFormField(
              perfixIcon: const Icon(
                Icons.email_outlined,
                color: AppConsts.neutral500,
              ),
              hint: StringsEn.email,
              onChanged: (String? value) => signUpCubit.onChangeValue(
                StringsEn.email,
                value!,
              ),
            ),
            const AspectRatio(
              aspectRatio: AppConsts.aspectRatio20on1,
            ),

            ///Password
            const PasswordWidget(),
            const AspectRatio(
              aspectRatio: AppConsts.aspectRatio20on1,
            ),

            ///confirm Password
            const ConfirmPasswordWidget(),
            const AspectRatio(
              aspectRatio: AppConsts.aspectRatio16on2,
            ),
          ],
        );
      },
    );
  }
}
