part of 'nav_bar_cubit.dart';

@immutable
sealed class NavBarState {}

final class NavBarInitial extends NavBarState {}

class Changed extends NavBarState {
  final int index;

  Changed(this.index);
}
