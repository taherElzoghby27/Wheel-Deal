import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/verification/presentation/view_model/verification_cubit/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/consts/enums.dart';

class ImageIdentityBlocBuilderSelfie extends StatelessWidget {
  const ImageIdentityBlocBuilderSelfie({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .072,
      child: BlocBuilder<VerificationCubit, VerificationState>(
        builder: (context, state) {
          if (state.selfieImageState == RequestState.loaded) {
            return state.selfieImage == null
                ? HandleImageWidget(image: image)
                : Image.file(state.selfieImage!);
          } else if (state.selfieImageState == RequestState.loading) {
            return const LoadingWidget();
          } else {
            return HandleImageWidget(image: image);
          }
        },
      ),
    );
  }
}
