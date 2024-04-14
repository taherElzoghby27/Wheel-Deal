import 'package:cars/features/home/presentation/view/widgets/best_offers_body.dart';
import 'package:flutter/material.dart';

class BestOffersView extends StatelessWidget {
  const BestOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BestOffersBody(),
      ),
    );
  }
}
