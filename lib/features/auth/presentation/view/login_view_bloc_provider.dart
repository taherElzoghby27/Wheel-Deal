import 'package:cars/core/services/service_locator.dart';
import 'package:cars/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_use_case.dart';
import '../widgets/login_body.dart';

class LoginViewBlocProvider extends StatelessWidget {
  const LoginViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt.get<LoginUseCase>(),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: const SafeArea(
          child: LoginBody(),
        ),
      ),
    );
  }
}
