import 'dart:io';

import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/verification/presentation/view_model/verification_cubit/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageIdentityBlocBuilder extends StatelessWidget {
  const ImageIdentityBlocBuilder({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<VerificationCubit>(
            context,
          );
          File? imgFileFront;
          File? imgFileBack;
          File? imgFileSelfie;
          if (state is PickedImagedLoadedFront &&
              title == StringsEn.scanTheFront) {
            imgFileFront = bloc.identityTypeModel.frontImage;
            return imgFileFront == null
                ? HandleImageWidget(image: image)
                : Image.file(imgFileFront);
          } else if (state is PickedImagedLoadedBack &&
              title == StringsEn.scanTheBack) {
            imgFileBack = bloc.identityTypeModel.backImage;
            return imgFileBack == null
                ? HandleImageWidget(image: image)
                : Image.file(imgFileBack);
          } else if (state is PickedImagedLoadedSelfie &&
              title == StringsEn.takeSelfieWithIdentity) {
            imgFileSelfie = bloc.identityTypeModel.selfieImage;
            return imgFileSelfie == null
                ? HandleImageWidget(image: image)
                : Image.file(imgFileSelfie);
          } else if (state is PickedImagedLoadingFront &&
              title == StringsEn.scanTheFront) {
            return const LoadingWidget();
          } else if (state is PickedImagedLoadingBack &&
              title == StringsEn.scanTheBack) {
            return const LoadingWidget();
          } else if (state is PickedImagedLoadingSelfie &&
              title == StringsEn.takeSelfieWithIdentity) {
            return const LoadingWidget();
          } else {
            return HandleImageWidget(image: image);
          }
        },
      ),
    );
  }
}
