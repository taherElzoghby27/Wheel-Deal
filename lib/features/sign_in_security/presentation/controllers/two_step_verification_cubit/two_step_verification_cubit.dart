import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'two_step_verification_state.dart';

class TwoStepVerificationCubit extends Cubit<TwoStepVerificationState> {
  TwoStepVerificationCubit() : super(TwoStepVerificationInitial());
  String page = '';
  bool twoStepVerification = false;

  changePage(String value) {
    page = value;
    emit(ChangePageStatus(value: value));
  }
}
