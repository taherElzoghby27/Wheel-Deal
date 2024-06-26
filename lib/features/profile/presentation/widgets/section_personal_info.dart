import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/home/presentation/widgets/top_leading_trailing.dart';
import 'package:cars/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/consts/strings.dart';
import '../../../../../core/widgets/custom_button_three_widget.dart';

class SectionPersonalInfo extends StatelessWidget {
  const SectionPersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is GetProfileLoaded) {
            return Column(
              children: [
                TopLeadingTrailing(
                  leading: StringsEn.personalInfo,
                  leadingColor: AppConsts.mainColor,
                ),
                const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
                CustomButtonThreeWidget(
                  leading: Icon(
                    Icons.person_2_outlined,
                    color: Theme.of(context).canvasColor.withOpacity(.8),
                  ),
                  title: StringsEn.id,
                  trailing: Text(
                    state.userProfileEntity.id,
                    style: AppConsts.style14,
                  ),
                  onTap: () {},
                ),
                CustomButtonThreeWidget(
                  leading: Icon(
                    Icons.email_outlined,
                    color: Theme.of(context).canvasColor.withOpacity(.8),
                  ),
                  trailing: Text(
                    state.userProfileEntity.email,
                    style: AppConsts.style14,
                  ),
                  title: StringsEn.email,
                  onTap: () {},
                ),
                CustomButtonThreeWidget(
                  leading: Icon(
                    Icons.phone,
                    color: Theme.of(context).canvasColor.withOpacity(.8),
                  ),
                  trailing: Text(
                    state.userProfileEntity.phone,
                    style: AppConsts.style14,
                  ),
                  title: StringsEn.phone,
                  onTap: () {},
                ),
              ],
            );
          } else if (state is GetProfileFailure) {
            return SomeThingErrorWidget(
              message: state.message,
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
