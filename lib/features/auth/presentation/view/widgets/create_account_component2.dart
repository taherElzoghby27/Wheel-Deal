import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/text_form_field.dart';
import 'package:cars/features/auth/presentation/view/widgets/gender_section.dart';
import 'package:cars/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'section_terms_and_conditions.dart';

class CreateAccountComponent2 extends StatelessWidget {
  const CreateAccountComponent2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final signUpCubit = context.read<SignUpCubit>();
        return Column(
          children: [
            CustomTextFormField(
              perfixIcon: const Icon(
                Icons.phone,
                color: AppConsts.neutral500,
              ),
              hint: StringsEn.phoneNumber,
              onChanged: (String? value) => signUpCubit.onChangeValue(
                StringsEn.phone,
                value!,
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            CustomTextFormField(
              perfixIcon: const Icon(
                Icons.person,
                color: AppConsts.neutral500,
              ),
              hint: StringsEn.age,
              onChanged: (String? value) => signUpCubit.onChangeValue(
                StringsEn.age,
                value!,
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 7,
                  child: CustomTextFormField(
                    perfixIcon: const Icon(
                      Icons.location_on_outlined,
                      color: AppConsts.neutral500,
                    ),
                    hint: StringsEn.city,
                    onChanged: (String? value) => signUpCubit.onChangeValue(
                      StringsEn.city,
                      value!,
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 7,
                  child: CustomTextFormField(
                    perfixIcon: const Icon(
                      Icons.location_on_outlined,
                      color: AppConsts.neutral500,
                    ),
                    hint: StringsEn.state,
                    onChanged: (String? value) => signUpCubit.onChangeValue(
                      StringsEn.state,
                      value!,
                    ),
                  ),
                ),
              ],
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            CustomTextFormField(
              perfixIcon: const Icon(
                Icons.location_on_outlined,
                color: AppConsts.neutral500,
              ),
              hint: StringsEn.address,
              onChanged: (String? value) => signUpCubit.onChangeValue(
                StringsEn.address,
                value!,
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            const GenderSection(),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            const SectionTermsAndConditions()
          ],
        );
      },
    );
  }
}
