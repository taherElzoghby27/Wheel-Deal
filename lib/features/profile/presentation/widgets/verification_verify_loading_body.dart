import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../manager/verification_cubit/verification_cubit.dart';

class VerificationVerifyLoadingBody extends StatefulWidget {
  const VerificationVerifyLoadingBody({super.key});

  @override
  State<VerificationVerifyLoadingBody> createState() =>
      _VerificationVerifyLoadingBodyState();
}

class _VerificationVerifyLoadingBodyState
    extends State<VerificationVerifyLoadingBody> {
  int current = 0;
  late VerificationCubit verificationCubit;

  @override
  void initState() {
    verificationCubit = BlocProvider.of<VerificationCubit>(context);
    handleMoveBetweenLoading(verificationCubit);
    super.initState();
  }

  handleMoveBetweenLoading(VerificationCubit verificationCubit) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        verificationCubit.changeLoadingCurrent(1);
        Future.delayed(
          const Duration(seconds: 3),
          () {
            verificationCubit.changeLoadingCurrent(2);
            Future.delayed(
              const Duration(seconds: 30),
              () {
                GoRouter.of(context).push(navPath);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        if (state is CurrentLoadingChanged) {
          current = state.value;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: AppConsts.padding15H,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HandleImageWidget(
                  image: current == 0 &&
                          state.userVerificationState == RequestState.loading
                      ? Assets.loadingVerify
                      : current == 1 &&
                              state.userVerificationState ==
                                  RequestState.loading
                          ? Assets.stillProcessing
                          : Assets.verified,
                ),
                const AspectRatio(aspectRatio: AppConsts.aspectRatio16on2),
                Text(
                  current == 0 &&
                          state.userVerificationState == RequestState.loading
                      ? StringsEn.loadingVerify
                      : current == 1 &&
                              state.userVerificationState ==
                                  RequestState.loading
                          ? StringsEn.stillProcessing
                          : StringsEn.verified,
                  textAlign: TextAlign.center,
                  style: AppConsts.style20.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
                Padding(
                  padding: AppConsts.padding50H,
                  child: Text(
                    current == 1 &&
                            state.userVerificationState == RequestState.loading
                        ? StringsEn.stillProcessingSubTitle
                        : current == 2
                            ? StringsEn.verifiedSubTitle
                            : '',
                    textAlign: TextAlign.center,
                    style: AppConsts.styleHint14.copyWith(
                      color: Theme.of(context).canvasColor.withOpacity(.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
