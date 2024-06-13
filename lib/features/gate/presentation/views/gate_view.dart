import 'package:flutter/material.dart';

import '../widgets/gate_body.dart';

class GateView extends StatelessWidget {
  const GateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: GateBody(),
      ),
    );
  }
}
