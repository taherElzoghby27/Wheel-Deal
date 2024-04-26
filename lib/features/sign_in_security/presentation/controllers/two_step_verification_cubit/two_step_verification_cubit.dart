import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'two_step_verification_state.dart';

class TwoStepVerificationCubit extends Cubit<TwoStepVerificationState> {
  TwoStepVerificationCubit() : super(TwoStepVerificationInitial());
  String page = '';

  changeSwitch(bool value) {
    emit(Switched(value: value));
  }

  changeSmsOrEmail(String value) {
    emit(SmsOrEmailState(value: value));
  }

  changePage(String value) {
    page = value;
    emit(ChangePageStatus(value: value));
  }
}
