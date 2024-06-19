import 'package:cars/core/consts/strings.dart';
import 'package:cars/core/widgets/text_field.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/search_cubit/search_cubit.dart';

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
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        SearchCubit bloc = BlocProvider.of<SearchCubit>(context);
        String status = '';
        if (state.valueChanged==RequestState.changed) {
          if (label == StringsEn.condition) {
            status = bloc.condition;
          } else if (label == StringsEn.brand) {
            status = bloc.brand??'';
          } else{
            status = bloc.bodyType??'';
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
          value: builderContext.read<SearchCubit>(),
          child: widget,
        );
      },
    );
  }
}
