import 'package:cars/core/consts/assets.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/features/verification/presentation/view_model/verification_cubit/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'scan_component.dart';

class IdentityTypeWidget extends StatelessWidget {
  const IdentityTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCubit, VerificationState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<VerificationCubit>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScanComponent(
              title: StringsEn.scanTheFront,
              subTitle1: StringsEn.weAcceptOnly,
              subTitle2: bloc.selectType == StringsEn.idCard
                  ? StringsEn.idCard
                  : bloc.selectType == StringsEn.passport
                      ? StringsEn.passport
                      : StringsEn.drivingLicense,
              image: bloc.selectType == StringsEn.idCard
                  ? Assets.idCard
                  : bloc.selectType == StringsEn.passport
                      ? Assets.passport
                      : Assets.drivingLicense,
              onTap: () {},
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
            bloc.selectType == StringsEn.idCard
                ? ScanComponent(
                    title: StringsEn.scanTheBack,
                    subTitle1: StringsEn.weAcceptOnly,
                    subTitle2: StringsEn.idCard,
                    image: Assets.idCard,
                    onTap: () {},
                  )
                : Container(),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
            Text(
              StringsEn.takeSelfieWithIdentity,
              style: AppConsts.style16White.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio40on1),
            Text(
              StringsEn.pleaseMakeSureSelfie,
              style: AppConsts.style12.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).canvasColor.withOpacity(.5),
              ),
            ),
            const AspectRatio(aspectRatio: AppConsts.aspectRatio24on2),
            ScanComponent(
              title: StringsEn.takeSelfieWithIdentity,
              subTitle2: StringsEn.subTitleSelfi,
              image: Assets.selfie,
              onTap: () {},
            ),
            bloc.selectType == StringsEn.idCard
                ? Container()
                : const AspectRatio(aspectRatio: AppConsts.aspectRatio16on4),
          ],
        );
      },
    );
  }
}
