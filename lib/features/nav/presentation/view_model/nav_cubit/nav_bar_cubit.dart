import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());
  int currentIndex = 0;
  //change page
  changeIndex(int index) {
    currentIndex = index;
    emit(Changed(currentIndex));
  }
}
