import 'package:cars/features/search/presentation/view_model/filter_cubit/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_builder_dialog.dart';

class BlocProviderConditionFieldFilterDialog extends StatelessWidget {
  const BlocProviderConditionFieldFilterDialog({
    super.key,
    required this.list,
    required this.status,
  });

  final List<String> list;
  final String status;

  @override
  Widget build(BuildContext context) {
    return BlocBuilderDialog(list: list, status: status);
  }
}
