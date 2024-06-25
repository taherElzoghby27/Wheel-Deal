import 'package:cars/core/consts/data.dart';
import 'package:cars/features/profile/presentation/manager/verification_cubit/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'radio_button_row.dart';

class IdentitiesList extends StatelessWidget {
  const IdentitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCubit, VerificationState>(
      builder: (context, state) {
        VerificationCubit bloc = BlocProvider.of<VerificationCubit>(context);
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: identities
              .map(
                (e) => RadioButtonRow(
                  label: e.type,
                  value: bloc.selectType,
                  onChanged: (value) => bloc.changeTypeIdentity(value!),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
