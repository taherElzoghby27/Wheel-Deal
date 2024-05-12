import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/service_locator.dart';
import 'package:cars/features/auth/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/usecases/reset_password_use_case.dart';
import 'widgets/create_new_pass_body.dart';
import 'widgets/leading_button_icon_app_bar.dart';

class CreatePassView extends StatelessWidget {
  const CreatePassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: LeadingIconButtonAppBar(
          onTap: () => GoRouter.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(StringsEn.resetPass),
      ),
      body: BlocProvider(
        create: (context) => ResetPasswordCubit(
          getIt.get<ResetPasswordUseCase>(),
        ),
        child: const SafeArea(
          child: CreateNewPassBody(),
        ),
      ),
    );
  }
}
