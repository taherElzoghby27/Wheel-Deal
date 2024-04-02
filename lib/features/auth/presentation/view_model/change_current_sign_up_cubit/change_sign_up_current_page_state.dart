part of 'change_sign_up_current_page_cubit.dart';

abstract class ChangeSignUpCurrentPageState extends Equatable {
  const ChangeSignUpCurrentPageState();
}

class ChangeSignUpCurrentPageInitial extends ChangeSignUpCurrentPageState {
  @override
  List<Object> get props => [];
}

class Changed extends ChangeSignUpCurrentPageState {
  final int value;

  const Changed({required this.value});

  @override
  List<Object?> get props => [value];
}
