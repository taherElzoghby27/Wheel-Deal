import 'package:bloc/bloc.dart';
import 'package:cars/features/search/presentation/view/widgets/condition_field.dart';
import 'package:meta/meta.dart';

part 'condition_state.dart';

class ConditionCubit extends Cubit<ConditionState> {
  ConditionCubit() : super(ConditionInitial());
  Condition condition = Condition.Used;

  changeCondition(Condition cond) {
    condition = cond;
    emit(ConditionChanged());
  }
}
