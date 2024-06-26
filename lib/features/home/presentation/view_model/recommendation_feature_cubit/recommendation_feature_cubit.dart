import 'package:bloc/bloc.dart';
import 'package:cars/features/home/domain/entities/previous_car_entity.dart';
import 'package:cars/features/home/domain/usecases/previous_car_use_case.dart';
import 'package:cars/features/home/domain/usecases/user_info_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/get_model_brand.dart';
import '../home_bloc/home_bloc.dart';

part 'recommendation_feature_state.dart';

class RecommendationFeatureCubit extends Cubit<RecommendationFeatureState> {
  final GetModelBrandUseCase _getModelBrandUseCase;
  final UserInfoUseCase _userInfoUseCase;

  final PreviousCarUseCase _previousCarUseCase;

  RecommendationFeatureCubit(
    this._getModelBrandUseCase,
    this._userInfoUseCase,
    this._previousCarUseCase,
  ) : super(RecommendationFeatureInitial());
  TextEditingController incomeController = TextEditingController();
  TextEditingController previousCarBrandController = TextEditingController();

  TextEditingController previousCarController = TextEditingController();

  double rating = 1;

  changeValue({required String value}) {
    previousCarController.text = value;
    emit(
      state.copyWith(
        valueChanged: RequestState.loaded,
        valueCh: previousCarController.text,
      ),
    );
  }

  changeValueRating(double value) {
    rating = value;
    emit(
      state.copyWith(
        valueChangedRating: RequestState.loaded,
        valueChRating: value,
      ),
    );
  }

  getModelBrand(String brand) async {
    if (brand.isNotEmpty) {
      emit(
        state.copyWith(getModelsTypesState: RequestState.loading),
      );
      await _getModelBrandUseCase.call(brand).then(
            (value) => value.fold(
              (left) {
                emit(
                  state.copyWith(
                    getModelsTypesState: RequestState.failure,
                    failureGetModelsTypes: left.message,
                  ),
                );
              },
              (right) {
                emit(
                  state.copyWith(
                    getModelsTypesState: RequestState.loaded,
                    carNames: right,
                  ),
                );
              },
            ),
          );
    } else {
      emit(
        state.copyWith(
          getModelsTypesState: RequestState.failure,
          failureGetModelsTypes: 'Please, select brand',
        ),
      );
    }
  }

  userInfo() async {
    if (incomeController.text.isNotEmpty) {
      emit(UserInfoLoading());
      await _userInfoUseCase.call(incomeController.text).then(
            (value) => value.fold(
              (left) {
                emit(
                  UserInfoFailure(message: left.message),
                );
              },
              (right) {
                emit(UserInfoLoaded());
              },
            ),
          );
    } else {
      emit(const UserInfoFailure(message: 'Please, Enter your Income'));
    }
  }

  previousCar() async {
    if (previousCarBrandController.text.isNotEmpty ||
        previousCarController.text.isNotEmpty) {
      emit(PreviousCarLoading());
      await _previousCarUseCase
          .call(PreviousCarEntity(
            previousCar: previousCarController.text,
            brand: previousCarBrandController.text,
            rating: rating,
          ))
          .then(
            (value) => value.fold(
              (left) {
                emit(
                  PreviousCarFailure(message: left.message),
                );
              },
              (right) {
                emit(PreviousCarLoaded());
              },
            ),
          );
    } else {
      emit(
        const PreviousCarFailure(message: 'Please, Enter Your Data'),
      );
    }
  }
}
