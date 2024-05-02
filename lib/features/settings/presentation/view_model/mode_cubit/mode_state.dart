part of 'mode_cubit.dart';

enum ThemeMod { light, dark }

@immutable
class ModeState extends Equatable {
  const ModeState({required this.themeMode});

  final ThemeMod themeMode;

  @override
  List<Object> get props => [themeMode];
}
