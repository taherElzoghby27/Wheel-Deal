import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/consts/strings.dart';
import '../../../../core/helper/custom_snack.dart';
import '../../../../core/widgets/small_loading_widget.dart';
import '../manager/profile_cubit/profile_cubit.dart';

class BlocConsumerYesButtonLogout extends StatelessWidget {
  const BlocConsumerYesButtonLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogoutLoaded) {
          GoRouter.of(context).pushReplacement(loginPath);
        } else if (state is LogoutFailure) {
          showSnack(
            context,
            message: state.message,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        return Visibility(
          replacement: const LoadingWidget(),
          visible: state is LogoutLoading ? false : true,
          child: CustomButton(
            text: StringsEn.logout,
            styleText: AppConsts.style16White,
            onTap: () async => await context.read<ProfileCubit>().logout(),
          ),
        );
      },
    );
  }
}
