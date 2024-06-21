import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/core/widgets/text_field.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: CustomTextField(
        controller: context.read<SearchCubit>().searchController,
        filled: AppConsts.neutral100.withOpacity(.05),
        perfixIcon: IconButton(
          onPressed: () => context.read<SearchCubit>().searchMethod(),
          icon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Theme.of(context).canvasColor.withOpacity(.5),
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () => GoRouter.of(context).push(
            filterPath,
            extra: <CarEntity>[],
          ),
          icon: Icon(
            Icons.tune,
            color: Theme.of(context).canvasColor.withOpacity(.5),
          ),
        ),
        hint: StringsEn.findAnyCar,
        border: AppConsts.normalBorderField.copyWith(
          borderRadius: AppConsts.mainRadius,
        ),
      ),
    );
  }
}
