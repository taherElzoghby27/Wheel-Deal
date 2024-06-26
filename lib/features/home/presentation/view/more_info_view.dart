import 'package:flutter/material.dart';

import '../../../../core/consts/strings.dart';
import '../widgets/more_info_body.dart';

class MoreInfoView extends StatelessWidget {
  const MoreInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(StringsEn.moreInfo),
      ),
      body: const SafeArea(
        child: MoreInfoBody(),
      ),
    );
  }
}
