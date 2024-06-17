import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/search/data/models/facilities_model.dart';
import 'package:cars/features/search/domain/entities/search_entity.dart';
import 'package:flutter/material.dart';

import '../../../domain/use_cases/search_filter_use_case.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  final SearchFilterUseCase _searchFilterUseCase;

  FilterCubit(this._searchFilterUseCase) : super(ConditionInitial());

  //fields
  String condition = conditions.first;
  String brand = brands.first;
  String bodyType = bodyTypes.first;

  //price range
  RangeValues currentRangeValues = const RangeValues(500000, 700000);

  changeValue({
    required String value,
    required String status,
  }) {
    if (status == StringsEn.condition) {
      condition = value;
    } else if (status == StringsEn.brand) {
      brand = value;
    } else if (status == StringsEn.bodyType) {
      bodyType = value;
    }
    debugPrint(condition);
    emit(ValueChange());
  }

  changePriceRange(RangeValues values) {
    currentRangeValues = values;
    emit(PriceRangeChanged());
  }

  changeFacility(bool value, FacilityModel facilityModel) {
    facilityModel.value = value;
    emit(ValueFacilityChange());
  }

  resetMethod() {}

  searchFilter() async {
    emit(SearchFilterLoading());
    await _searchFilterUseCase
        .call(
          SearchFilterEntity(
            condition: condition,
            bodyType: bodyType,
            brand: brand,
            minPrice: currentRangeValues.start.toString(),
            maxPrice: currentRangeValues.end.toString(),
            airBag: facilities[0].value ? '1' : '0',
            touchScreen: facilities[1].value ? '1' : '0',
            connectivity: facilities[2].value ? '1' : '0',
            airCondition: facilities[3].value ? '1' : '0',
            brakeAssist: facilities[4].value ? '1' : '0',
            remoteEngineStartStop: facilities[5].value ? '1' : '0',
            navigationSystem: facilities[6].value ? '1' : '0',
          ),
        )
        .then(
          (value) => value.fold(
            (failure) {
              emit(
                SearchFilterFailure(message: failure.message),
              );
            },
            (List<CarEntity> success) {
              emit(
                SearchFilterLoaded(cars: success),
              );
            },
          ),
        );
  }
}
