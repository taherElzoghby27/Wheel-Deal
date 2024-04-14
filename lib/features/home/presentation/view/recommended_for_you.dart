import 'package:flutter/material.dart';

import 'widgets/recommended_for_you_body.dart';

class RecommendedForyouView extends StatelessWidget {
  const RecommendedForyouView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: RecommendedForyouBody(),
      ),
    );
  }
}
