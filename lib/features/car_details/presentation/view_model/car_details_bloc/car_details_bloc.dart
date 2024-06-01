import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:cars/features/car_details/data/models/installment_model.dart';
import 'package:cars/features/car_details/domain/use_cases/get_car_details_use_case.dart';
import 'package:cars/features/car_details/domain/use_cases/get_installment_available_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'car_details_event.dart';

part 'car_details_state.dart';

class CarDetailsBloc extends Bloc<CarDetailsEvent, CarDetailsState> {
  final GetCarDetailsUseCase _getCarDetailsUseCase;
  final GetInstallmentAvailableUseCase _getInstallmentAvailableUseCase;

  CarDetailsBloc(
    this._getCarDetailsUseCase,
    this._getInstallmentAvailableUseCase,
  ) : super(const CarDetailsState()) {
    on<CarDetailsEvent>(
      (event, emit) async {
        if (event is CrDetailsEvent) {
          await crDetailsEventMethod(emit, event);
        } else if (event is InstallmentAvailableEvent) {
          await installmentAvailableEventMethod(emit, event);
        }
      },
    );
  }

  Future<void> installmentAvailableEventMethod(
    Emitter<CarDetailsState> emit,
    InstallmentAvailableEvent event,
  ) async {
    await _getInstallmentAvailableUseCase.call(event.carId).then(
          (value) => value.fold(
            (failure) {
              emit(state.copyWith(
                installmentState: RequestState.error,
                installmentFailureMessage: failure.message,
              ));
            },
            (installments) {
              emit(
                state.copyWith(
                  installmentState: RequestState.loaded,
                  installments: installments,
                ),
              );
            },
          ),
        );
  }

  Future<void> crDetailsEventMethod(
    Emitter<CarDetailsState> emit,
    CrDetailsEvent event,
  ) async {
    await _getCarDetailsUseCase.call(event.carId).then(
          (value) => value.fold(
            (failure) {
              emit(state.copyWith(
                carDetailsState: RequestState.error,
                carDetailsFailureMessage: failure.message,
              ));
            },
            (carModel) {
              emit(
                state.copyWith(
                  carDetailsState: RequestState.loaded,
                  carModel: carModel,
                ),
              );
            },
          ),
        );
  }
}
