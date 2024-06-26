import 'package:cars/core/helper/handle_image.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/verification_cubit/verification_cubit.dart';

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
