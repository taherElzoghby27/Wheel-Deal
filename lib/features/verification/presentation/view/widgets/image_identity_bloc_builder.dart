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

          if (state is PickedImagedLoadedFront &&
              title == StringsEn.scanTheFront) {
            File? imgFileFront;
            imgFileFront = bloc.identityTypeModel.frontImage;
            debugPrint('1');
            return imgFileFront == null
                ? HandleImageWidget(image: image)
                : Image.file(imgFileFront);
          } else if (state is PickedImagedLoadedBack &&
              title == StringsEn.scanTheBack) {
            File? imgFileBack;
            imgFileBack = bloc.identityTypeModel.backImage;
            debugPrint('2');
            return imgFileBack == null
                ? HandleImageWidget(image: image)
                : Image.file(imgFileBack);
          } else if (state is PickedImagedLoadedSelfie &&
              title == StringsEn.takeSelfieWithIdentity) {
            File? imgFileSelfie;
            imgFileSelfie = bloc.identityTypeModel.selfieImage;
            debugPrint('3');
            return imgFileSelfie == null
                ? HandleImageWidget(image: image)
                : Image.file(imgFileSelfie);
          } else if (state is PickedImagedLoadingFront &&
              title == StringsEn.scanTheFront) {
            debugPrint('4');
            return const LoadingWidget();
          } else if (state is PickedImagedLoadingBack &&
              title == StringsEn.scanTheBack) {
            debugPrint('5');
            return const LoadingWidget();
          } else if (state is PickedImagedLoadingSelfie &&
              title == StringsEn.takeSelfieWithIdentity) {
            debugPrint('6');
            return const LoadingWidget();
          } else {
            if (bloc.identityTypeModel.frontImage != null) {
              debugPrint('7');
              return Image.file(bloc.identityTypeModel.frontImage!);
            } else if (bloc.identityTypeModel.backImage != null) {
              debugPrint('8');
              return Image.file(bloc.identityTypeModel.backImage!);
            } else if (bloc.identityTypeModel.selfieImage != null) {
              debugPrint('9');
              return Image.file(bloc.identityTypeModel.selfieImage!);
            } else {
              return HandleImageWidget(image: image);
            }
          }
        },
      ),
    );
  }
}
