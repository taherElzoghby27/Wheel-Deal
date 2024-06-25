import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../../../profile/presentation/widgets/tile_bottom_sheet.dart';

class ContentBottomSheetLanguage extends StatelessWidget {
  const ContentBottomSheetLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TileBottomSheet(
            label: StringsEn.english,
            onTap: () {},
          ),
          CustomDivider(
            color: Theme.of(context).canvasColor.withOpacity(.1),
          ),
          TileBottomSheet(
            label: StringsEn.arabic,
            onTap: () {},
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
