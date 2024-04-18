import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(ConditionInitial());
  String condition = conditions.first;
  String brand = brands.first;
  String bodyType = bodyTypes.first;
  String model = models.first;

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
    emit(ConditionChanged());
  }
}
