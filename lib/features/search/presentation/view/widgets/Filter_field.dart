import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/text_field.dart';
import 'package:cars/features/search/presentation/view_model/filter_cubit/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterField extends StatelessWidget {
  const FilterField({
    super.key,
    required this.label,
    required this.widget,
  });

  final String label;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        FilterCubit bloc = BlocProvider.of<FilterCubit>(context);
        String status = '';
        if (state is ValueChange) {
          if (label == StringsEn.condition) {
            status = bloc.condition;
          } else if (label == StringsEn.brand) {
            status = bloc.brand;
          } else if (label == StringsEn.bodyType) {
            status = bloc.bodyType;
          } else if (label == StringsEn.model) {
            status = bloc.model;
          }
          debugPrint('status $status');
        }
        return CustomTextField(
          hint: status.isEmpty ? label : status,
          readOnly: true,
          suffixIcon: IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => widget,
            ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(context).canvasColor,
            ),
          ),
        );
      },
    );
  }
}
