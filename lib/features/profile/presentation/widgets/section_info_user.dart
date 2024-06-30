import 'package:cars/core/helper/assets.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/custom_circle_image.dart';
import 'package:cars/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionInfoUser extends StatelessWidget {
  const SectionInfoUser({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        CustomCircleImage(
          image: Assets.personUnknown,
          onTap: () {},
        ),
        const AspectRatio(aspectRatio: AppConsts.aspectRatioTopSpace),
        SizedBox(
          width: size.width * .5.w,
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              String name = 'unknown';
              if (state is GetProfileLoaded) {
                name =
                    '${state.userProfileEntity.firstName} ${state.userProfileEntity.lastName}';
              }
              return Text(
                name,
                style: AppConsts.style20.copyWith(
                  color: Theme.of(context).canvasColor,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
        ),
      ],
    );
  }
}
