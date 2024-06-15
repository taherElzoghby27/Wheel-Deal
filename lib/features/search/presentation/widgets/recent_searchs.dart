import 'package:flutter/material.dart';
import '../../../../../core/widgets/tile_widget.dart';
import 'recent_search_bloc_builder.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({
    super.key,
    required this.tileHint,
  });

  final String tileHint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TileWidget(label: tileHint),

        ///recent searches
        const RecentSearchBlocBuilder(),
      ],
    );
  }
}
