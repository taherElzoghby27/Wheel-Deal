import 'package:cars/core/di/service_locator.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:cars/features/car_details/data/models/installment_model.dart';
import 'package:cars/features/car_details/data/repos/car_details_repo_impl.dart';
import 'package:cars/features/car_details/domain/use_cases/get_car_details_use_case.dart';
import 'package:cars/features/car_details/domain/use_cases/get_installment_available_use_case.dart';
import 'package:cars/features/car_details/presentation/view_model/car_details_bloc/car_details_bloc.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'installment_list_view.dart';

class BlocProviderInstallmentListView extends StatelessWidget {
  const BlocProviderInstallmentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarDetailsBloc(
        GetCarDetailsUseCase(
          carDetailsRepo: getIt.get<CarDetailsRepoImpl>(),
        ),
        GetInstallmentAvailableUseCase(
          carDetailsRepo: getIt.get<CarDetailsRepoImpl>(),
        ),
      )..add(
          InstallmentAvailableEvent(
            //todo
            carId: 41,
            //carId: CarEntity.getCarId()!.toInt(),
          ),
        ),
      child: BlocBuilder<CarDetailsBloc, CarDetailsState>(
        builder: (context, state) {
          if (state.installmentState == RequestState.loaded) {
            List<InstallmentAvailableModel> installmentsList =
                state.installments;
            return InstallmentListView(
              installments: installmentsList,
            );
          } else if (state.installmentState == RequestState.failure) {
            return SomeThingErrorWidget(
              message: state.installmentFailureMessage,
            );
          } else {
            return const Center(
              child: LoadingWidget(),
            );
          }
        },
      ),
    );
  }
}
