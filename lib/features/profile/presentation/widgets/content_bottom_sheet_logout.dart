import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/service_locator.dart';
import 'package:cars/core/widgets/custom_button_with_border.dart';
import 'package:cars/core/widgets/custom_divider.dart';
import 'package:cars/features/profile/data/repos/profile_repo_impl.dart';
import 'package:cars/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/style.dart';
import '../../domain/use_cases/logout_use_case.dart';
import '../manager/profile_cubit/profile_cubit.dart';
import 'bloc_consumer_yes_button_logout.dart';

class ContentBottomSheetLogout extends StatelessWidget {
  const ContentBottomSheetLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        GetProfileUseCase(
          profileRepo: getIt.get<ProfileRepoImpl>(),
        ),
        LogoutUseCase(
          profileRepo: getIt.get<ProfileRepoImpl>(),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AspectRatio(
            aspectRatio: AppConsts.aspectRatio24on2,
          ),
          Center(
            child: Text(
              StringsEn.logout,
              style: AppConsts.style16White.copyWith(
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
          Padding(
            padding: AppConsts.mainPadding,
            child: const CustomDivider(),
          ),
          const AspectRatio(
            aspectRatio: AppConsts.aspectRatio24on2,
          ),
          const Text(
            StringsEn.areYouSureYouWantToLogout,
            style: AppConsts.styleHint14,
          ),
          const AspectRatio(
            aspectRatio: AppConsts.aspectRatio24on2,
          ),
          Row(
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 5,
                child: CustomButtonWithBorder(
                  text: StringsEn.cancel,
                  onTap: () => GoRouter.of(context).pop(),
                ),
              ),
              const Spacer(flex: 1),
              const Expanded(
                flex: 5,
                child: BlocConsumerYesButtonLogout(),
              ),
              const Spacer(flex: 1),
            ],
          ),
          const AspectRatio(
            aspectRatio: AppConsts.aspectRatio24on2,
          ),
        ],
      ),
    );
  }
}
