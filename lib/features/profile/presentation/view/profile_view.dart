import 'package:cars/core/consts/strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar_scaffold.dart';
import '../widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarScaffold(
        title: StringsEn.profile,
      ),
      body: SafeArea(
        child: ProfileBody(),
      ),
    );
  }
}
