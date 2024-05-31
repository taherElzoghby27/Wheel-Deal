import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/features/car_details/domain/use_cases/get_car_details_use_case.dart';
import 'package:cars/features/car_details/presentation/view/widgets/car_details_body_bloc_builder.dart';
import 'package:cars/features/car_details/presentation/view_model/car_details_bloc/car_details_bloc.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/book_mark_animation.dart';
import '../../../../core/widgets/custom_app_bar_scaffold.dart';
import '../../../../core/widgets/custom_squre_button.dart';
import '../../data/repos/car_details_repo_impl.dart';

class CarDetailsBlocProviderView extends StatelessWidget {
  const CarDetailsBlocProviderView({
    super.key,
    required this.carEntity,
  });

  final CarEntity carEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarScaffold(
        leading: CustomSquareButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: () => GoRouter.of(context).pop(),
        ),
        title: StringsEn.details,
        trailing: IconWidgetAnimation(
          icon: Icons.favorite,
          paddingIcon: AppConsts.padding8,
          carEntity: carEntity,
        ),
      ),
      body: BlocProvider(
        create: (_) => CarDetailsBloc(
          GetCarDetailsUseCase(
            carDetailsRepo: getIt.get<CarDetailsRepoImpl>(),
          ),
        )..add(
            CrDetailsEvent(carId: carEntity.id.toInt()),
          ),
        child: const CarDetailsBodyBlocBuilder(),
      ),
    );
  }
}
