import 'package:cars/features/auth/presentation/view_model/change_current_sign_up_cubit/change_sign_up_current_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'leading_button_icon_app_bar.dart';

class IconButtonSignUpBlocConsumer extends StatefulWidget {
  const IconButtonSignUpBlocConsumer({super.key});

  @override
  State<IconButtonSignUpBlocConsumer> createState() =>
      _IconButtonSignUpBlocConsumerState();
}

class _IconButtonSignUpBlocConsumerState
    extends State<IconButtonSignUpBlocConsumer> {
  int current = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeSignUpCurrentPageCubit,
        ChangeSignUpCurrentPageState>(
      listener: (context, state) {
        if (state is Changed) {
          current = state.value;
        }
      },
      builder: (context, state) {
        return current == 1
            ? Container()
            : LeadingIconButtonAppBar(
                onTap: () =>
                    BlocProvider.of<ChangeSignUpCurrentPageCubit>(context)
                        .change(1),
              );
      },
    );
  }
}
