import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/usecases/checking_for_reset_password_use_case.dart';
import '../view_model/check_for_reset_cubit/check_for_reset_cubit.dart';
import '../widgets/leading_button_icon_app_bar.dart';
import '../widgets/reset_pass_body.dart';

class ResetPassViewBlocProvider extends StatelessWidget {
  const ResetPassViewBlocProvider({super.key});

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
        title: const Text(StringsEn.forgotPasswordLabel),
      ),
      body: BlocProvider(
        create: (context) => CheckForResetCubit(
          getIt.get<VerifyEmailUseCase>(),
        ),
        child: const SafeArea(
          child: ResetPassBody(),
        ),
      ),
    );
  }
}
