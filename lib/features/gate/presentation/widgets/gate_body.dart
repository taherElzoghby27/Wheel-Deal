import 'package:cars/core/consts/methods.dart';
import 'package:cars/core/consts/routesPage.dart';
import 'package:cars/core/widgets/small_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/consts/strings.dart';

class GateBody extends StatefulWidget {
  const GateBody({super.key});

  @override
  State<GateBody> createState() => _GateBodyState();
}

class _GateBodyState extends State<GateBody> {
  @override
  void initState() {
    super.initState();
    _initializeAuthGate();
  }

  Future<void> _initializeAuthGate() async {
    String? token = await readFromCache(
      StringsEn.token,
    );
    //checks if the widget is still part of the widget tree
    if (mounted) {
      if (token != null) {
        // if (isAuthenticated) {
        //   DioHelper.initialize(UserAccessToken.accessToken!);
        // }
        GoRouter.of(context).pushReplacement(navPath);
      } else {
        GoRouter.of(context).pushReplacement(boardPath);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const LoadingWidget();
  }
}
