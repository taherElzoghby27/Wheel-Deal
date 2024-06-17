import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/text_field.dart';
import 'package:cars/features/search/presentation/manager/filter_cubit/filter_cubit.dart';
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
          }
          debugPrint('status $status');
        }
        return Builder(
          builder: (builderContext) {
            return CustomTextField(
              filled: Theme.of(context).canvasColor.withOpacity(.05),
              hint: status.isEmpty ? label : status,
              readOnly: true,
              suffixIcon: IconButton(
                onPressed: () => _onTapSubmit(builderContext),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).canvasColor,
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _onTapSubmit(BuildContext builderContext) {
    showDialog(
      context: builderContext,
      barrierColor: Theme.of(builderContext).canvasColor.withOpacity(.5),
      builder: (_) {
        return BlocProvider.value(
          value: builderContext.read<FilterCubit>(),
          child: widget,
        );
      },
    );
  }
}
