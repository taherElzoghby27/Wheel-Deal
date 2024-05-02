import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'mode_state.dart';

class ModeCubit extends Cubit<ModeState> {
  ModeCubit() : super(const ModeState(themeMode: ThemeMod.dark));

  void toggleTheme() {
    final newThemeMode =
        state.themeMode == ThemeMod.light ? ThemeMod.dark : ThemeMod.light;
    emit(ModeState(themeMode: newThemeMode));
  }
}
