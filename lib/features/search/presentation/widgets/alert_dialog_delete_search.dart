import 'package:cars/core/helper/strings.dart';
import 'package:cars/core/theming/style.dart';
import 'package:cars/core/widgets/customButton.dart';
import 'package:cars/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AlertDialogDeleteHistory extends StatelessWidget {
  const AlertDialogDeleteHistory({
    super.key,
    required this.searchWord,
  });

  final String searchWord;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(StringsEn.areYouSureToDeleteHistory),
      actions: [
        CustomButton(
          text: StringsEn.yes,
          background: AppConsts.success500,
          onTap: () async {
            await context.read<SearchCubit>().deleteRecentSearch(
                  searchWord: searchWord,
                );
            GoRouter.of(context).pop();
          },
        ),
        CustomButton(
          text: StringsEn.no,
          onTap: () => GoRouter.of(context).pop(),
        ),
      ],
    );
  }
}
