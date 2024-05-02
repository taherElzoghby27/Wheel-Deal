import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/consts/strings.dart';
import '../../view_model/settings_cubit/setting_cubit.dart';
import 'content_language_bottom_sheet.dart';
import 'tile_settings.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (builderContext) {
      return TileSetting(
        leading: StringsEn.language,
        trailing: TextButton(
          onPressed: () {
            buildShowModalBottomSheet(builderContext);
          },
          child: Row(
            children: [
              Text(
                StringsEn.english,
                style: AppConsts.style12.copyWith(
                  color: Theme.of(context).canvasColor,
                  fontSize: 10,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppConsts.mainColor,
                size: 12,
              ),
            ],
          ),
        ),
      );
    });
  }

  buildShowModalBottomSheet(BuildContext builderContext) {
    return showModalBottomSheet(
      context: builderContext,
      shape: AppConsts.dialogShape,
      builder: (_) {
        return BlocProvider.value(
          value: builderContext.read<SettingCubit>(),
          child: const ContentBottomSheetLanguage(),
        );
      },
    );
  }
}
