import 'package:cars/core/consts/enums.dart';
import 'package:cars/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSection extends StatelessWidget {
  const GenderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildRadioButton(Gender.Male),
          buildRadioButton(Gender.Female),
        ],
      ),
    );
  }

  Widget buildRadioButton(Gender gender) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = context.read<SignUpCubit>();
        return Row(
          children: [
            Radio<Gender>(
              value: gender,
              fillColor: MaterialStateProperty.all(
                Theme.of(context).canvasColor,
              ),
              groupValue: cubit.selectedGender,
              onChanged: (value) => cubit.changeGender(value!),
            ),
            Text(
              gender.name,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).canvasColor,
                  ),
            ),
          ],
        );
      },
    );
  }
}
