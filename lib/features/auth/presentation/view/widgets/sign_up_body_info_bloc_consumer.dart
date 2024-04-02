import 'package:cars/core/consts/style.dart';
import 'package:cars/features/auth/presentation/view/widgets/sign_up_body_info.dart';
import 'package:cars/features/auth/presentation/view_model/change_current_sign_up_cubit/change_sign_up_current_page_cubit.dart';
import 'package:cars/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBodyInfoBlocConsumer extends StatefulWidget {
  const SignUpBodyInfoBlocConsumer({super.key});

  @override
  State<SignUpBodyInfoBlocConsumer> createState() =>
      _SignUpBodyInfoBlocConsumerState();
}

class _SignUpBodyInfoBlocConsumerState
    extends State<SignUpBodyInfoBlocConsumer> {
  late SignUpCubit bloc;
  int current = 1;

  @override
  void initState() {
    bloc = BlocProvider.of<SignUpCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Form(
        key: bloc.formKey,
        child: BlocConsumer<ChangeSignUpCurrentPageCubit,
            ChangeSignUpCurrentPageState>(
          listener: (context, state) {
            if (state is Changed) {
              current = state.value;
            }
          },
          builder: (context, state) {
            return SignUpBodyInfo(
              current: current,
              registerButton: () => BlocProvider.of<SignUpCubit>(context)
                  .registerButton(context, current),
            );
          },
        ),
      ),
    );
  }
}
