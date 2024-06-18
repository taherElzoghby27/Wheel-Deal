import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/consts/style.dart';

class ShowResultFilterButton extends StatelessWidget {
  const ShowResultFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspectRatioButtonAuth,
      child: BlocListener<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state.searchState == RequestState.loaded) {
            //pop
            GoRouter.of(context).pop();
          }
        },
        child: CustomButton(
          text: StringsEn.showResult,
          styleText: AppConsts.style16White,
          onTap: () async => await context.read<SearchCubit>().searchFilter(),
        ),
      ),
    );
  }
}
