import 'package:bloc/bloc.dart';
import 'package:cars/features/home/domain/entities/previous_car_entity.dart';
import 'package:cars/features/home/domain/usecases/previous_car_use_case.dart';
import 'package:cars/features/home/domain/usecases/user_info_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/get_model_brand.dart';

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

  getModelBrand(String? brand) async {
    if (brand != null) {
      emit(GetModelBrandLoading());
      await _getModelBrandUseCase.call(brand).then(
            (value) => value.fold(
              (left) {
                emit(
                  GetModelBrandFailure(message: left.message),
                );
              },
              (PreviousCarEntity right) {
                emit(GetModelBrandLoaded(previousCarEntity: right));
              },
            ),
          );
    } else {
      emit(GetModelBrandFailure(message: 'Please, select brand'));
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
      emit(UserInfoFailure(message: 'Please, Enter your Income'));
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
        PreviousCarFailure(message: 'Please, Enter Your Data'),
      );
    }
  }
}
