import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/auth_top_section.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'create_account_component1.dart';
import 'create_account_component2.dart';
import 'replacement_auth_widget.dart';

class SignUpBodyInfo extends StatefulWidget {
  const SignUpBodyInfo({
    super.key,
    required this.current,
    required this.registerButton,
  });

  final int current;
  final void Function() registerButton;

  @override
  State<SignUpBodyInfo> createState() => _SignUpBodyInfoState();
}

class _SignUpBodyInfoState extends State<SignUpBodyInfo>
    with SingleTickerProviderStateMixin {
  late SignUpCubit bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<SignUpCubit>(context);
    //init controller
    bloc.controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    //offset animation
    bloc.offsetAnimation =
        TweenSequence(itemsSequences).animate(bloc.controller);
    super.initState();
  }

  bool isLoading = false;

  @override
  void dispose() {
    bloc.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatio20on1),

        ///top section
        const AuthTopSection(
          title: StringsEn.getStarted,
          subTitle: StringsEn.enterYourDetailsBelow,
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatioTopSpace,
        ),

        //fields
        AnimatedBuilder(
          animation: bloc.controller,
          builder: (context, child) {
            return AnimatedSlide(
              offset: bloc.offsetAnimation.value,
              duration: const Duration(milliseconds: 200),
              child: widget.current == 1
                  ? const CreateAccountComponent1()
                  : const CreateAccountComponent2(),
            );
          },
        ),
        const AspectRatio(
          aspectRatio: AppConsts.aspectRatio20on1,
        ),

        //register
        AspectRatio(
          aspectRatio: AppConsts.aspectRatioButtonAuth.sp,
          child: Visibility(
            visible: !isLoading,
            replacement: const LoadingWidget(),
            child: CustomButton(
              text: widget.current == 1 ? StringsEn.next : StringsEn.register,
              onTap: widget.registerButton,
            ),
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
        //already have an account
        ReplacementAuthWidget(
          label: StringsEn.alreadyHaveAccount,
          trailing: StringsEn.login,
          onTap: () => GoRouter.of(context).pushReplacement(
            loginPath,
          ),
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
      ],
    );
  }
}
