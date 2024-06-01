part of 'car_details_bloc.dart';

@immutable
class CarDetailsState extends Equatable {
  final RequestState carDetailsState;
  final CarModel? carModel;
  final String carDetailsFailureMessage;
  final RequestState installmentState;
  final List<InstallmentAvailableModel> installments;
  final String installmentFailureMessage;

  const CarDetailsState({
    this.carDetailsState = RequestState.loading,
    this.carDetailsFailureMessage = 'No Data',
    this.carModel,
    this.installmentState = RequestState.loading,
    this.installments = const [],
    this.installmentFailureMessage = 'No Data',
  });

  CarDetailsState copyWith({
    RequestState? carDetailsState,
    CarModel? carModel,
    String? carDetailsFailureMessage,
    RequestState? installmentState,
    List<InstallmentAvailableModel>? installments,
    String? installmentFailureMessage,
  }) =>
      CarDetailsState(
        carDetailsState: carDetailsState ?? this.carDetailsState,
        carModel: carModel ?? this.carModel,
        carDetailsFailureMessage:
            carDetailsFailureMessage ?? this.carDetailsFailureMessage,
        installmentState: installmentState ?? this.installmentState,
        installments: installments ?? this.installments,
        installmentFailureMessage:
            installmentFailureMessage ?? this.installmentFailureMessage,
      );

  @override
  List<Object?> get props => [
        carDetailsState,
        carModel,
        carDetailsFailureMessage,
        installmentState,
        installments,
        installmentFailureMessage,
      ];
}
