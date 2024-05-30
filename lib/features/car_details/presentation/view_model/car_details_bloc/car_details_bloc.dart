import 'package:bloc/bloc.dart';
import 'package:cars/core/models/car_model.dart';
import 'package:cars/features/car_details/domain/use_cases/get_car_details_use_case.dart';
import 'package:meta/meta.dart';

part 'car_details_event.dart';

part 'car_details_state.dart';

class CarDetailsBloc extends Bloc<CarDetailsEvent, CarDetailsState> {
  final GetCarDetailsUseCase _getCarDetailsUseCase;

  CarDetailsBloc(this._getCarDetailsUseCase) : super(CarDetailsInitial()) {
    on<CarDetailsEvent>(
      (event, emit) {
        if (event is CrDetailsEvent) {
          crDetailsEventMethod(emit, event);
        }
      },
    );
  }

  void crDetailsEventMethod(
    Emitter<CarDetailsState> emit,
    CrDetailsEvent event,
  ) {
    emit(CarDetailsLoading());
    _getCarDetailsUseCase.call(event.carId).then(
      (value) {
        value.fold(
          (failure) {
            emit(CarDetailsFailure(message: failure.message));
          },
          (carModel) {
            emit(CarDetailsLoaded(carModel: carModel));
          },
        );
      },
    );
  }
}
