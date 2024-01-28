import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/style.dart';
import 'package:cars/features/nav/presentation/view/widgets/nav_body.dart';
import 'package:cars/features/nav/presentation/view_model/nav_cubit/nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavView extends StatelessWidget {
  const NavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is Changed) {
            currentIndex = state.index;
          }
          return screens[currentIndex];
        },
      ),
      bottomNavigationBar: const NavBody(),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: AppConsts.primary500,
        onPressed: () {},
        shape: AppConsts.circleFloatButtonBorder,
        child: const Icon(
          Icons.add,
          color: AppConsts.neutral100,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
