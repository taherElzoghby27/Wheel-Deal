import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changed_carsoul_state.dart';

class ChangedCarsoulCubit extends Cubit<ChangedCarsoulState> {
  ChangedCarsoulCubit() : super(ChangedCarsoulInitial());

  changeCarsoulIndex(int index) {
    emit(ChangedCrslState(index: index));
  }
}
