import 'package:flutter/material.dart';

import 'widgets/reset_pass_body.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ResetPassBody(),
      ),
    );
  }
}
