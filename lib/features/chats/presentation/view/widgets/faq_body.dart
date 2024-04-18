import 'package:flutter/cupertino.dart';

import 'custom_type_info_help_center.dart';

class FaqBody extends StatelessWidget {
  const FaqBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
      ],
    );
  }
}
