import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(ConditionInitial());

  //fields
  String condition = conditions.first;
  String brand = brands.first;
  String bodyType = bodyTypes.first;
  String model = models.first;

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
    } else if (status == StringsEn.model) {
      model = value;
    }
    debugPrint(condition);
    emit(ValueChange());
  }

  changePriceRange(RangeValues values) {
    currentRangeValues = values;
    emit(PriceRangeChanged());
  }
}
