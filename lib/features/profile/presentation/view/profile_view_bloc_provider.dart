import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/services/service_locator.dart';
import 'package:cars/features/profile/data/repos/profile_repo_impl.dart';
import 'package:cars/features/profile/domain/use_cases/get_profile_use_case.dart';
import 'package:cars/features/profile/domain/use_cases/logout_use_case.dart';
import 'package:cars/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_app_bar_scaffold.dart';
import '../widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarScaffold(
        title: StringsEn.profile,
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit(
          GetProfileUseCase(
            profileRepo: getIt.get<ProfileRepoImpl>(),
          ),
          LogoutUseCase(
            profileRepo: getIt.get<ProfileRepoImpl>(),
          ),
        )..getProfile(),
        child: const SafeArea(
          child: ProfileBody(),
        ),
      ),
    );
  }
}
