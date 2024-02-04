import 'package:cars/features/location/presentation/view/widgets/search_location_body.dart';
import 'package:flutter/material.dart';

class SearchLocationView extends StatelessWidget {
  const SearchLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchLocationBody(),
      ),
    );
  }
}
