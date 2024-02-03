import 'package:flutter/material.dart';

import 'widgets/favourites_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: FavouritesBody(),
      ),
    );
  }
}
