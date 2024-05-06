import 'package:cars/core/consts/style.dart';
import 'package:cars/features/settings/presentation/view_model/mode_cubit/mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/consts/strings.dart';
import 'tile_settings.dart';

class DarkModeWidget extends StatelessWidget {
  const DarkModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TileSetting(
      leading: StringsEn.darkMode,
      trailing: BlocBuilder<ModeCubit, ModeState>(
        builder: (context, state) {
          final themeState = BlocProvider.of<ModeCubit>(context).state;
          return Switch.adaptive(
            value: themeState.themeMode == ThemeMod.dark,
            activeTrackColor: AppConsts.mainColor,
            thumbColor: MaterialStateProperty.all(
              AppConsts.neutral100,
            ),
            inactiveTrackColor: Theme.of(context).canvasColor.withOpacity(.1),
            onChanged: (value) =>
                BlocProvider.of<ModeCubit>(context).toggleTheme(),
          );
        },
      ),
    );
  }
}
