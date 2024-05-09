import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/sign_up_cubit/sign_up_cubit.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = context.read<SignUpCubit>();
        return CustomTextFormField(
          perfixIcon: const Icon(
            Icons.lock,
            color: AppConsts.neutral500,
          ),
          hint: StringsEn.password,
          obscureText: cubit.visiblePass1,
          suffixIcon: IconButton(
            onPressed: () => cubit.changeVisible(StringsEn.password),
            icon: Icon(
              cubit.visiblePass1 ? Icons.visibility : Icons.visibility_off,
              color: AppConsts.neutral500,
            ),
          ),
          onChanged: (String? value) => cubit.password = value,
        );
      },
    );
  }
}
