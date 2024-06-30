import 'package:cars/core/theming/style.dart';
import 'package:flutter/material.dart';

class TileDialogInstallment extends StatelessWidget {
  const TileDialogInstallment({
    super.key,
    required this.first,
    required this.second,
    required this.third,
    required this.forth,
    this.color,
  });

  final String first;
  final String second;
  final String third;
  final String forth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.padding8,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              first,
              style: AppConsts.style12.copyWith(
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 4,
            child: Text(
              second,
              style: AppConsts.style12.copyWith(
                color: color ?? Theme.of(context).canvasColor,
                fontWeight: color == null ? FontWeight.w500 : FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 2),
          Expanded(
            flex: 4,
            child: Text(
              third,
              style: AppConsts.style12.copyWith(
                color: color ?? Theme.of(context).canvasColor,
                fontWeight: color == null ? FontWeight.w500 : FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 2),
          Expanded(
            flex: 4,
            child: Text(
              forth,
              style: AppConsts.style12.copyWith(
                color: color ?? Theme.of(context).canvasColor,
                fontWeight: color == null ? FontWeight.w500 : FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
