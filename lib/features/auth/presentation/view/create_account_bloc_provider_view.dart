import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/service_locator.dart';
import 'package:cars/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/sign_up_usecase.dart';
import '../view_model/change_current_sign_up_cubit/change_sign_up_current_page_cubit.dart';
import 'widgets/create_account_body.dart';
import 'widgets/icon_button_sign_up_bloc_consumer.dart';

class CreateAccountBlocProviderView extends StatelessWidget {
  const CreateAccountBlocProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ChangeSignUpCurrentPageCubit(),
        ),
        BlocProvider(
          create: (_) => SignUpCubit(
            getIt.get<SignUpUseCase>(),
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: const IconButtonSignUpBlocConsumer(),
          centerTitle: true,
          title: const Text(StringsEn.signUp),
        ),
        body: const SafeArea(
          child: CreateAccountBody(),
        ),
      ),
    );
  }
}
