import 'package:cars/core/routing/routes_page.dart';
import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/features/car_details/domain/use_cases/get_car_details_use_case.dart';
import 'package:cars/features/car_details/domain/use_cases/get_installment_available_use_case.dart';
import 'package:cars/features/car_details/presentation/view_model/car_details_bloc/car_details_bloc.dart';
import 'package:cars/features/favourites/data/repos/favourites_repo_impl.dart';
import 'package:cars/features/favourites/domain/use_cases/add_favourite_use_case.dart';
import 'package:cars/features/favourites/domain/use_cases/delete_favourite_use_case.dart';
import 'package:cars/features/favourites/domain/use_cases/get_favourites_use_case.dart';
import 'package:cars/features/favourites/presentation/manager/favourite_cubit.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/orders/domain/use_cases/get_orders_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/widgets/book_mark_animation.dart';
import '../../../../core/widgets/custom_app_bar_scaffold.dart';
import '../../../../core/widgets/custom_squre_button.dart';
import '../../../orders/data/repos/order_repo_impl.dart';
import '../../../orders/domain/use_cases/add_order_use_case.dart';
import '../../../orders/domain/use_cases/delete_order_use_case.dart';
import '../../../orders/presentation/manager/order_cubit.dart';
import '../../data/repos/car_details_repo_impl.dart';
import '../widgets/car_details_body_bloc_builder.dart';

class CarDetailsBlocProviderView extends StatelessWidget {
  const CarDetailsBlocProviderView({
    super.key,
    required this.carEntity,
  });

  final CarEntity carEntity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CarDetailsBloc(
            GetCarDetailsUseCase(
              carDetailsRepo: getIt.get<CarDetailsRepoImpl>(),
            ),
            GetInstallmentAvailableUseCase(
              carDetailsRepo: getIt.get<CarDetailsRepoImpl>(),
            ),
          )..add(
              CrDetailsEvent(carId: int.parse(carEntity.id)),
            ),
        ),
        BlocProvider(
          create: (_) => FavouriteCubit(
            GetFavouritesUseCase(
              favouritesRepo: getIt.get<FavouritesRepoImpl>(),
            ),
            AddFavUseCase(
              favouritesRepo: getIt.get<FavouritesRepoImpl>(),
            ),
            DeleteFavUseCase(
              favouritesRepo: getIt.get<FavouritesRepoImpl>(),
            ),
          )..getFav(),
        ),
        BlocProvider(
          create: (_) => OrderCubit(
            GetOrdersUseCase(
              orderRepo: getIt.get<OrderRepoImpl>(),
            ),
            AddOrderUseCase(
              orderRepo: getIt.get<OrderRepoImpl>(),
            ),
            DeleteOrderUseCase(
              orderRepo: getIt.get<OrderRepoImpl>(),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBarScaffold(
          leading: CustomSquareButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => GoRouter.of(context).pushReplacement(navPath),
          ),
          title: StringsEn.details,
          trailing: IconWidgetAnimation(
            icon: Icons.favorite,
            paddingIcon: AppConsts.padding8,
            carEntity: carEntity,
          ),
        ),
        body: const CarDetailsBodyBlocBuilder(),
      ),
    );
  }
}
