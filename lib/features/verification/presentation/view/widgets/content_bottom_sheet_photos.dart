import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/helper/custom_snack.dart';
import 'package:cars/features/verification/presentation/view_model/verification_cubit/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_divider.dart';
import 'tile_bottom_sheet.dart';

class ContentBottomSheetPhoto extends StatelessWidget {
  const ContentBottomSheetPhoto({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        if (state.frontImageState == RequestState.loaded ||
            state.backImageState == RequestState.loaded ||
            state.selfieImageState == RequestState.loaded) {
          GoRouter.of(context).pop();
        } else if (state.frontImageState == RequestState.error ||
            state.backImageState == RequestState.error ||
            state.selfieImageState == RequestState.error) {
          showSnack(
            context,
            message: state.imageError,
            backGroundColor: AppConsts.danger500,
          );
        }
      },
      builder: (context, state) {
        VerificationCubit bloc = BlocProvider.of<VerificationCubit>(context);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TileBottomSheet(
              label: StringsEn.takeAPhoto,
              iconData: FontAwesomeIcons.camera,
              onTap: () => bloc.pickImage(
                status: status,
                cameraOrGallery: StringsEn.camera,
              ),
            ),
            const CustomDivider(),
            TileBottomSheet(
              label: StringsEn.chooseFromGallery,
              iconData: FontAwesomeIcons.image,
              onTap: () => bloc.pickImage(
                status: status,
                cameraOrGallery: StringsEn.gallery,
              ),
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }
}
