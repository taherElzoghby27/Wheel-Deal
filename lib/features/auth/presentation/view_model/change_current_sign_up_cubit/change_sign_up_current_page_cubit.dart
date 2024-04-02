import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_sign_up_current_page_state.dart';

class ChangeSignUpCurrentPageCubit extends Cubit<ChangeSignUpCurrentPageState> {
  ChangeSignUpCurrentPageCubit() : super(ChangeSignUpCurrentPageInitial());
  int current = 1;

  change(int value) {
    current = value;
    emit(Changed(value: value));
  }

}
