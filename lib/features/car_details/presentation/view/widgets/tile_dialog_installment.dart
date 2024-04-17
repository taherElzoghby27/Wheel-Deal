import 'package:cars/core/consts/style.dart';
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
              style: AppConsts.style14,
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: Text(
              second,
              style: AppConsts.style14.copyWith(
                color: color,
                fontWeight: color == null ? FontWeight.w500 : FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              third,
              style: AppConsts.style14.copyWith(
                color: color,
                fontWeight: color == null ? FontWeight.w500 : FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              forth,
              style: AppConsts.style14.copyWith(
                color: color,
                fontWeight: color == null ? FontWeight.w500 : FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
