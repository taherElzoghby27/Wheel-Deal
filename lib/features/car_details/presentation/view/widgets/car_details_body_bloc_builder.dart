import 'package:cars/core/models/car_model.dart';
import 'package:cars/core/widgets/error_widget.dart';
import 'package:cars/features/car_details/presentation/view_model/car_details_bloc/car_details_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'car_details_body.dart';
import 'loading_shimmer_car_details.dart';

class CarDetailsBodyBlocBuilder extends StatelessWidget {
  const CarDetailsBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarDetailsBloc, CarDetailsState>(
      builder: (context, state) {
        if (state is CarDetailsLoaded) {
          CarModel car = state.carModel;
          return CarDetailsBody(carModel: car);
        } else if (state is CarDetailsFailure) {
          return SomeThingErrorWidget(message: state.message);
        } else {
          return const LoadingCarDetails();
        }
      },
    );
  }
}
